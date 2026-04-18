-- =============================================
--  BLUE HAVEN NEWS — ARTICLE TEMPLATES
--  Each category has multiple phrasings.
--  {street} {vehicle} {area} are substituted at runtime.
-- =============================================

NewsTemplates = {}

-- ── MAJOR HEISTS ─────────────────────────────────────────────────────────────
NewsTemplates.bankrobbery = {
    tier    = "BREAKING",
    titles  = { "Bank Robbery Reported", "Armed Robbery at Local Branch", "Financial Institution Targeted" },
    bodies  = {
        "Blue Haven Police are responding to reports of an armed robbery at a financial institution near {street}. Officers have sealed off the surrounding area. Residents are urged to avoid the vicinity.",
        "BHPD have confirmed an ongoing incident at a bank in the {street} area. Armed individuals are believed to be involved. A large police presence has been established.",
        "Reports are coming in of a brazen robbery at a banking facility on {street}. Emergency services are on scene. The public are advised to stay clear of the area.",
    }
}

NewsTemplates.paletobankrobbery = {
    tier    = "BREAKING",
    titles  = { "Paleto Savings Under Siege", "Armed Incident in Paleto Bay", "North County Bank Targeted" },
    bodies  = {
        "Blue Haven News can confirm an armed robbery is underway at the Paleto Bay savings branch. BHPD units are en route. Residents in the north county are advised to stay indoors.",
        "Dramatic scenes unfolding in Paleto Bay this evening as armed individuals are reported inside the local banking branch. Air support has been requested.",
        "An armed robbery is in progress at the Paleto Bay bank. Eyewitnesses report a heavy police presence forming along the main road. More details to follow.",
    }
}

NewsTemplates.pacificbankrobbery = {
    tier    = "BREAKING",
    titles  = { "Pacific Standard Under Attack", "Major Heist at Pacific Standard", "City's Largest Bank Targeted" },
    bodies  = {
        "In what appears to be a highly organised operation, armed individuals have breached the Pacific Standard Public Library building in the heart of Blue Haven. BHPD SWAT units are mobilising.",
        "Blue Haven is on lockdown tonight as a large-scale robbery unfolds at the Pacific Standard bank. This is believed to be a coordinated criminal operation. Updates to follow.",
        "Armed suspects are reportedly inside the Pacific Standard bank. Police have established a wide perimeter. This is developing — stay with Blue Haven News for the latest.",
    }
}

NewsTemplates.vangelicorobbery = {
    tier    = "BREAKING",
    titles  = { "Jewellery Heist on Portola Drive", "Vangelico Targeted by Armed Gang", "Luxury Jewellers Raided" },
    bodies  = {
        "Vangelico Fine Jewellers on Portola Drive has been targeted by armed robbers. Police are on scene and the area has been cordoned off. Significant losses are expected.",
        "Armed individuals have raided the renowned Vangelico jewellery store. CCTV footage is being reviewed. BHPD urge anyone with information to come forward.",
        "Blue Haven's premier jewellery destination has fallen victim to a brazen armed robbery. Officers are appealing for witnesses. The store has been closed as a crime scene.",
    }
}

NewsTemplates.artgalleryrobbery = {
    tier    = "BREAKING",
    titles  = { "Art Gallery Heist Reported", "Priceless Works Targeted", "Cultural Landmark Raided" },
    bodies  = {
        "Armed thieves have struck a Blue Haven art gallery, making off with what witnesses describe as multiple high-value artworks. BHPD's specialist crimes unit is leading the investigation.",
        "Police are investigating a brazen art theft in the city. Several pieces of significant cultural value are feared stolen. The gallery has been closed to the public.",
        "In a daring daylight raid, armed suspects targeted a local art gallery near {street}. Security staff were reportedly overpowered. More details expected at a press conference later today.",
    }
}

NewsTemplates.humanelabsrobbery = {
    tier    = "BREAKING",
    titles  = { "Security Breach at Research Facility", "Humane Labs Targeted", "Armed Incident at Science Campus" },
    bodies  = {
        "Blue Haven Police are responding to a serious security breach at the Humane Labs and Research facility. The nature of what was taken, if anything, has not been confirmed. Specialist units are on scene.",
        "An armed intrusion has been reported at the Humane Labs research campus. Staff have been evacuated. Authorities are treating this as a high-priority incident.",
        "Concerns are growing after an armed group breached the perimeter of a classified research facility outside the city. No further details are available at this time pending a full security assessment.",
    }
}

NewsTemplates.bobcatsecurityheist = {
    tier    = "BREAKING",
    titles  = { "Bobcat Security Convoy Ambushed", "Armoured Truck Targeted", "Security Firm Under Attack" },
    bodies  = {
        "Armed criminals have ambushed a Bobcat Security armoured convoy near {street}. The vehicle was reportedly carrying a significant cash shipment. BHPD are in pursuit.",
        "A Bobcat Security vehicle has been intercepted in what appears to be a planned operation. Officers are responding in force. Expect road closures in the surrounding area.",
        "Blue Haven News understands that a coordinated attack on a Bobcat Security transport has taken place near {street}. The full extent of losses is not yet known.",
    }
}

NewsTemplates.storerobbery = {
    tier    = "CITY NEWS",
    titles  = { "Local Shop Robbed at Gunpoint", "Armed Robbery at Convenience Store", "Shop Staff Shaken After Raid" },
    bodies  = {
        "BHPD responded to reports of an armed robbery at a convenience store near {street} earlier today. Staff are reported safe. The suspect fled on foot before officers arrived.",
        "A local business near {street} was targeted by an armed individual earlier this evening. No injuries have been reported. Police are reviewing security footage.",
        "Officers are appealing for witnesses after a shop on {street} was robbed at gunpoint. The suspect made off with an undisclosed amount of cash. Anyone with information is asked to contact BHPD.",
    }
}

-- ── LARGE OPERATIONS ─────────────────────────────────────────────────────────
NewsTemplates.trainrobbery = {
    tier    = "BREAKING",
    titles  = { "Train Robbery Reported", "Freight Train Targeted", "Rail Incident Under Investigation" },
    bodies  = {
        "Blue Haven Police are responding to reports of an armed robbery targeting a freight train in the {street} area. The operation appears to have been well-planned. Air support is assisting.",
        "In scenes reminiscent of a bygone era, armed suspects have reportedly boarded and robbed a moving freight train. BHPD are coordinating a large-scale response.",
        "A freight service has been targeted by armed criminals near {street}. The full extent of what was taken is under investigation. Rail services in the area face disruption.",
    }
}

NewsTemplates.yachtheist = {
    tier    = "BREAKING",
    titles  = { "Luxury Yacht Boarded by Armed Gang", "Maritime Incident Off Blue Haven Coast", "Coastal Heist Underway" },
    bodies  = {
        "The Blue Haven Harbour Authority has confirmed an armed boarding of a luxury vessel off the coast. BHPD Marine Unit is responding. The yacht's owner has not been identified.",
        "An audacious maritime heist is underway off the Blue Haven coastline. Armed individuals have reportedly seized control of a private yacht. Coast Guard units are en route.",
        "Police are responding to a serious incident at sea following reports of an armed takeover of a luxury vessel near the harbour. Further details will follow.",
    }
}

NewsTemplates.drugboatrobbery = {
    tier    = "DEVELOPING",
    titles  = { "Suspicious Maritime Activity Reported", "Coastguard Investigating Sea Incident", "Vessel Intercepted Off Coast" },
    bodies  = {
        "The Blue Haven Coastguard is investigating a suspicious vessel off the coast near {street}. The nature of the incident has not been disclosed. BHPD Marine Unit is assisting.",
        "Police are looking into a maritime incident following reports of unusual activity near the Blue Haven waterfront. No further details are available at this time.",
        "Authorities are on scene following a disturbance involving a vessel near the Blue Haven coast. An investigation is underway.",
    }
}

NewsTemplates.vanrobbery = {
    tier    = "CITY NEWS",
    titles  = { "Delivery Van Ambushed", "Armed Robbery Targets Transport Vehicle", "Van Hijacked Near {street}" },
    bodies  = {
        "Armed individuals targeted a delivery van near {street} in a brazen daylight robbery. The driver was unharmed. Police are appealing for dashcam footage from motorists in the area.",
        "BHPD are investigating the armed robbery of a commercial van near {street}. The suspects fled in a separate vehicle. Officers are reviewing CCTV.",
        "A transport vehicle was ambushed near {street} by armed criminals earlier today. Enquiries are ongoing. Anyone who witnessed the incident is asked to come forward.",
    }
}

NewsTemplates.unionrobbery = {
    tier    = "BREAKING",
    titles  = { "Union Depository Targeted", "Armoured Facility Under Siege", "Major Robbery at Secure Depot" },
    bodies  = {
        "Blue Haven Police are responding to reports of an armed robbery at the Union Depository near {street}. This is considered a high-security target. Specialist firearms units are en route.",
        "In what is being described as an extremely bold operation, armed suspects have targeted the Union Depository. A significant law enforcement response is underway.",
        "The Union Depository is the scene of an ongoing armed incident. Road closures are in effect around {street}. Blue Haven News will continue to update as the situation develops.",
    }
}

NewsTemplates.undergroundrobbery = {
    tier    = "BREAKING",
    titles  = { "Underground Facility Breached", "Subterranean Heist Reported", "Armed Incident Below City Streets" },
    bodies  = {
        "Police are responding to reports of an armed intrusion at an underground facility in the Blue Haven area. The exact location has not been publicly disclosed.",
        "Blue Haven News understands that an armed group has breached a below-ground facility. Specialist units are involved in the response. Full details remain unclear.",
        "An underground operation appears to be underway in the city. BHPD have closed access to several areas near {street}. This is a developing situation.",
    }
}

-- ── STREET CRIME ─────────────────────────────────────────────────────────────
NewsTemplates.houserobbery = {
    tier    = "CITY NEWS",
    titles  = { "Residential Break-In Reported", "Home Burglary Near {street}", "Property Targeted by Thieves" },
    bodies  = {
        "Police are investigating a burglary at a residential property near {street}. The occupants were not home at the time. BHPD are urging residents to ensure their homes are secured.",
        "A home on {street} was broken into earlier today. Officers are canvassing the area for witnesses. Neighbours are advised to check their security cameras.",
        "BHPD received reports of a break-in at a property near {street}. Investigations are ongoing. Residents in the area should report any suspicious activity.",
    }
}

NewsTemplates.carboosting = {
    tier    = "CITY NEWS",
    titles  = { "Vehicle Stolen to Order", "Car Theft Ring Suspected", "High-Value Vehicle Taken" },
    bodies  = {
        "Police believe a vehicle was taken to order near {street} in what appears to be a professional theft operation. Owners of high-value cars in the area are being warned to remain vigilant.",
        "BHPD are investigating the suspicious theft of a {vehicle} near {street}. The manner of the theft suggests organised criminal involvement.",
        "A targeted vehicle theft has been reported near {street}. Officers suspect this may be linked to an organised car theft operation. Full enquiries are underway.",
    }
}

NewsTemplates.carjack = {
    tier    = "CITY NEWS",
    titles  = { "Carjacking Reported", "Driver Forced from Vehicle", "Armed Carjacking Near {street}" },
    bodies  = {
        "A driver was forced from their {vehicle} at gunpoint near {street}. The victim was not seriously injured. Police are searching for the suspect.",
        "BHPD are responding to a carjacking incident near {street}. The stolen vehicle, a {vehicle}, is being tracked. No injuries to the victim have been reported.",
        "An individual was carjacked near {street} in the early hours. The suspect fled in the victim's {vehicle}. Officers are appealing for witnesses.",
    }
}

NewsTemplates.vehicletheft = {
    tier    = "CITY NEWS",
    titles  = { "Vehicle Reported Stolen", "Car Theft on {street}", "Police Hunt Stolen {vehicle}" },
    bodies  = {
        "A {vehicle} has been reported stolen from {street}. Police have circulated the vehicle details and are appealing for sightings.",
        "Officers are searching for a stolen {vehicle} last seen near {street}. Members of the public are asked not to approach the vehicle if spotted.",
        "A vehicle theft has been logged near {street}. BHPD are conducting enquiries. Dashcam footage from the area is being requested.",
    }
}

-- ── INCIDENTS ────────────────────────────────────────────────────────────────
NewsTemplates.shooting = {
    tier    = "BREAKING",
    titles  = { "Shots Fired in Blue Haven", "Shooting Incident Reported", "Gunfire Heard Near {street}" },
    bodies  = {
        "Police are responding to reports of shots fired near {street}. Officers are on scene and the area has been cordoned off. Members of the public should avoid the area.",
        "Blue Haven residents reported hearing gunfire near {street}. BHPD are treating the incident seriously and a number of units are on scene.",
        "A shooting has been reported in the {street} area. At least one person is believed to have been injured. Police have appealed for witnesses to come forward.",
    }
}

NewsTemplates.vehicleshots = {
    tier    = "BREAKING",
    titles  = { "Drive-By Shooting Reported", "Shots Fired from Moving Vehicle", "Vehicle-Related Shooting Near {street}" },
    bodies  = {
        "Witnesses reported shots being fired from a moving vehicle near {street}. BHPD are searching for the vehicle. Residents are urged to stay away from windows.",
        "A drive-by shooting has been reported near {street}. Police have established a scene cordon. Enquiries into the motive are underway.",
        "Officers are investigating a shooting from a vehicle near {street}. This is believed to be a targeted attack. Police are appealing for dashcam footage.",
    }
}

NewsTemplates.fight = {
    tier    = "CITY NEWS",
    titles  = { "Brawl Breaks Out in Blue Haven", "Public Order Incident Reported", "Altercation Near {street}" },
    bodies  = {
        "BHPD responded to a public order disturbance near {street} earlier this evening. Several individuals were involved. Officers attended and dispersed the group.",
        "A fight involving multiple individuals was reported near {street}. Police made attendance and the situation was brought under control. Minor injuries are reported.",
        "Public order officers responded to reports of a large altercation near {street}. Enquiries into the cause of the disturbance are continuing.",
    }
}

NewsTemplates.explosion = {
    tier    = "BREAKING",
    titles  = { "Explosion Reported in Blue Haven", "Blast Heard Near {street}", "Emergency Services Respond to Explosion" },
    bodies  = {
        "Emergency services are responding to reports of an explosion near {street}. The cause is unknown at this time. Residents in the area are asked to stay indoors.",
        "A large explosion has been reported near {street}. Fire crews and police are en route. The blast was heard across several neighbourhoods.",
        "Blue Haven emergency services are dealing with an explosion in the {street} area. Structural damage is being assessed. Authorities are asking the public to avoid the area.",
    }
}

NewsTemplates.signrobbery = {
    tier    = "CITY NEWS",
    titles  = { "Street Sign Tampering Reported", "Vandalism Incident Near {street}", "Public Infrastructure Targeted" },
    bodies  = {
        "Police are investigating an act of vandalism near {street} after signage was reported damaged or stolen. The council has been notified.",
        "A minor public order incident near {street} has been referred to police after what appears to be deliberate interference with street infrastructure.",
        "Officers attended a call near {street} relating to the removal of public signage. Enquiries are ongoing.",
    }
}

-- ── PRISON ───────────────────────────────────────────────────────────────────
NewsTemplates.prisonbreak = {
    tier    = "BREAKING",
    titles  = { "Prison Break Underway", "Inmate Escape Attempt Reported", "Bolingbroke on Lockdown" },
    bodies  = {
        "Blue Haven News can confirm that an escape attempt is underway at Bolingbroke Penitentiary. All available units have been deployed. The public should report any suspicious individuals immediately.",
        "BHPD have issued an urgent alert following reports of an attempted prison break at Bolingbroke. A perimeter is being established. Do not approach escaped individuals.",
        "Scenes of chaos at Bolingbroke Penitentiary as what appears to be a coordinated escape attempt is underway. Helicopter assets have been deployed. Stay with Blue Haven News.",
    }
}

-- ── EMS ──────────────────────────────────────────────────────────────────────
NewsTemplates.civdown = {
    tier    = "CITY NEWS",
    titles  = { "Medical Incident Reported", "Person Down Near {street}", "Emergency Services Called to {street}" },
    bodies  = {
        "Blue Haven Emergency Medical Services responded to a call near {street} earlier today. A person was treated at the scene. No further details have been released.",
        "EMS attended an incident near {street} after reports of a person requiring urgent medical attention. The individual has been assessed by paramedics.",
        "Paramedics were called to the {street} area following a report of a medical emergency. The scene has since been cleared.",
    }
}

NewsTemplates.civdead = {
    tier    = "DEVELOPING",
    titles  = { "Body Found Near {street}", "Suspicious Death Under Investigation", "Police Launch Enquiry After Discovery" },
    bodies  = {
        "Police are investigating after a body was discovered near {street}. The death is being treated as unexplained pending a full post-mortem examination. A scene guard is in place.",
        "Officers have cordoned off an area near {street} following the discovery of a deceased individual. The circumstances surrounding the death are under investigation.",
        "Blue Haven detectives have opened an enquiry following what is being described as a suspicious death near {street}. A forensic team is currently on scene.",
    }
}

-- ── CITY DESK (Vague) ─────────────────────────────────────────────────────────
NewsTemplates.suspicioushandoff = {
    tier    = "CITY NEWS",
    titles  = { "Suspicious Activity Reported", "Police Investigate Street Incident", "Officers Attend Unexplained Meeting Near {street}" },
    bodies  = {
        "Police attended reports of a suspicious exchange near {street}. No arrests have been made at this stage. Enquiries are continuing.",
        "Officers responded to a call regarding suspicious individuals near {street}. The matter is being looked into by the local policing team.",
        "A member of the public raised concerns about suspicious activity near {street}. Police attended and are making enquiries.",
    }
}

NewsTemplates.susactivity = {
    tier    = "CITY NEWS",
    titles  = { "Unusual Activity Flagged Near {street}", "Police Called to Unexplained Incident", "Officers Attend Suspicious Scene" },
    bodies  = {
        "Residents near {street} contacted police after witnessing what they described as suspicious behaviour. Officers attended and are investigating.",
        "BHPD are looking into a report of suspicious activity in the {street} area. No further information is available at this time.",
        "A call was logged near {street} relating to behaviour described as suspicious by an eyewitness. Police are following a number of lines of enquiry.",
    }
}

-- ── VEHICLE PURCHASE ──────────────────────────────────────────────────────────
NewsTemplates.vehiclePurchase = {
    tier    = "CITY NEWS",
    titles  = { "Luxury Wheels Hit Blue Haven Streets", "High-End Motor Spotted in the City", "New Arrival: {vehicle} Turns Heads" },
    bodies  = {
        "Blue Haven's roads are a little more glamorous today as a brand-new {vehicle} was spotted leaving the dealership. City car enthusiasts are taking notice.",
        "A new {vehicle} has found a home in Blue Haven — another sign that the city's automotive scene is thriving. The vehicle was purchased this afternoon.",
        "Petrolheads rejoice: a {vehicle} has just been registered in Blue Haven. Our city continues to attract luxury vehicle ownership in impressive numbers.",
    }
}

-- ── PROPERTY PURCHASE ────────────────────────────────────────────────────────
NewsTemplates.propertyPurchase = {
    tier    = "CITY NEWS",
    titles  = { "New Homeowner in Blue Haven", "Property Market Stays Strong", "Another Resident Plants Roots" },
    bodies  = {
        "Blue Haven's property market shows no signs of cooling as another resident has secured a new home in the city. Estate agents describe demand as robust.",
        "A new property has changed hands in Blue Haven today — adding to the growing community of homeowners calling our city home.",
        "The Blue Haven housing market welcomed another new owner today. With properties in high demand, the city's residential landscape continues to evolve.",
    }
}

-- ── WEATHER ───────────────────────────────────────────────────────────────────
NewsTemplates.weather = {
    tier    = "CITY NEWS",
    titles  = { "Blue Haven Weather Update", "Forecast: {condition}", "Met Office Issues Update for Blue Haven" },
    bodies  = {
        "The Blue Haven Met Office is reporting {condition} across the city. Residents are advised to dress accordingly and drive with care.",
        "Our city is currently experiencing {condition}. Blue Haven News advises commuters to allow extra time for their journeys.",
        "Weather conditions across Blue Haven have shifted to {condition}. Emergency services remind the public to adjust their driving to suit current road conditions.",
    }
}

-- ── FILLER / SCHEDULED ────────────────────────────────────────────────────────
NewsTemplates.filler = {
    {
        tier  = "CITY NEWS",
        title = "Good Morning Blue Haven",
        body  = "Blue Haven News brings you the latest from around our city. Stay with us throughout the day for breaking stories, city updates, and everything you need to know.",
    },
    {
        tier  = "CITY NEWS",
        title = "City Council Confirms Infrastructure Works",
        body  = "The Blue Haven City Council has announced ongoing maintenance works across several key routes. Residents are advised to expect minor delays in affected areas over the coming weeks.",
    },
    {
        tier  = "CITY NEWS",
        title = "Crime Statistics Released for Blue Haven",
        body  = "BHPD have released their latest monthly crime figures. Officers say community cooperation remains key to keeping Blue Haven safe. Report all suspicious activity on 101.",
    },
    {
        tier  = "CITY NEWS",
        title = "Blue Haven Business Community Thriving",
        body  = "The Chamber of Commerce has praised the resilience of local business owners this quarter. New enterprises continue to open across the city, adding jobs and vitality to the economy.",
    },
    {
        tier  = "CITY NEWS",
        title = "Reminder: BHPD Non-Emergency Line",
        body  = "Blue Haven Police remind residents that non-emergency reports can be made via the 311 line. Officers thank the community for their ongoing cooperation and vigilance.",
    },
    {
        tier  = "CITY NEWS",
        title = "Blue Haven Roads: Travel Advice",
        body  = "The Blue Haven transport authority advises road users to remain cautious on city roads this evening. Please drive to the conditions and report dangerous driving to BHPD.",
    },
    {
        tier  = "CITY NEWS",
        title = "Local Events This Weekend",
        body  = "Blue Haven has a packed calendar this weekend. From car meets to community gatherings, there is something for everyone. Stay safe and enjoy the city.",
    },
    {
        tier  = "CITY NEWS",
        title = "EMS Reminder: Know Your Nearest Hospital",
        body  = "Blue Haven EMS urges all residents to know the location of their nearest medical facility. In an emergency, every second counts. Programme the emergency line into your phone.",
    },
}
