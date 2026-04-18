'use strict';

const container   = document.getElementById('news-container');
const tierBlock   = document.getElementById('tier-block');
const tierLabel   = document.getElementById('tier-label');
const headline    = document.getElementById('headline');
const bodyText    = document.getElementById('body-text');
const scrollTrack = document.getElementById('body-scroll-track');
const liveDot     = document.getElementById('live-dot');
const timeValue   = document.getElementById('time-value');

let hideTimeout = null;

// ── RESOURCE NAME (no recursion) ──────────────────────────────────────────────
// FiveM injects GetParentResourceName as a plain global, not on window.
// Wrapping it avoids the infinite recursion caused by window.X calling itself.
const resourceName = (typeof GetParentResourceName !== 'undefined')
    ? GetParentResourceName()
    : 'paradise-news';

// ── CLOCK ─────────────────────────────────────────────────────────────────────
function updateClock() {
    const now = new Date();
    const h = String(now.getHours()).padStart(2, '0');
    const m = String(now.getMinutes()).padStart(2, '0');
    timeValue.textContent = `${h}:${m}`;
}
updateClock();
setInterval(updateClock, 10000);

// ── TIER STYLING ──────────────────────────────────────────────────────────────
function applyTier(tier) {
    tierBlock.className = '';
    liveDot.classList.remove('visible');

    const t = (tier || '').toUpperCase();

    if (t === 'BREAKING') {
        tierBlock.classList.add('breaking');
        tierLabel.textContent = '⬤  Breaking';
        liveDot.classList.add('visible');
    } else if (t === 'DEVELOPING') {
        tierBlock.classList.add('developing');
        tierLabel.textContent = 'Developing';
    } else {
        tierBlock.classList.add('citynews');
        tierLabel.textContent = 'City News';
    }
}

// ── SCROLL SETUP ──────────────────────────────────────────────────────────────
function setupScroll(text, duration) {
    bodyText.textContent = text + '          ◆          ' + text + '          ◆          ';

    scrollTrack.style.animation = 'none';
    scrollTrack.style.transform = 'translateX(0)';
    void scrollTrack.offsetWidth;

    const trackWidth = scrollTrack.scrollWidth;
    const halfWidth  = trackWidth / 2;
    const speed      = Math.max(60, halfWidth / duration);
    const animDur    = halfWidth / speed;

    scrollTrack.style.animation = `scrollText ${animDur}s linear infinite`;
}

// ── SHOW ──────────────────────────────────────────────────────────────────────
function showBroadcast(data) {
    if (hideTimeout) {
        clearTimeout(hideTimeout);
        hideTimeout = null;
    }

    applyTier(data.tier);
    headline.textContent = data.title || 'Blue Haven News';
    setupScroll(data.body || '', (data.duration || 12000) / 1000);
    updateClock();

    container.classList.remove('slide-out');
    void container.offsetWidth;
    container.classList.add('slide-in');

    const duration = data.duration || 12000;
    hideTimeout = setTimeout(hideBroadcast, duration);
}

// ── HIDE ──────────────────────────────────────────────────────────────────────
function hideBroadcast() {
    container.classList.remove('slide-in');
    container.classList.add('slide-out');

    setTimeout(() => {
        fetch(`https://${resourceName}/close`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({})
        }).catch(() => {});
    }, 500);
}

// ── NUI MESSAGE HANDLER ───────────────────────────────────────────────────────
window.addEventListener('message', function(event) {
    const data = event.data;
    if (!data || !data.action) return;

    if (data.action === 'show') {
        showBroadcast(data);
    } else if (data.action === 'hide') {
        hideBroadcast();
    }
});
