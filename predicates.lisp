;; These are predicates which we think should possibly go into our system.
;; By building this list over time we will reduce the burden and improve the accuracy of our systems.

(isa ?DOCUMENT Document)

(hasReadDocument ?AGENT ?DOCUMENT)
(hasSeenDocument ?AGENT ?DOCUMENT)
(relevantDocument ?TOPIC ?DOCUMENT)
(researchWebsite ?SYSTEM ?WEBSITE)

(hasLicense ?ARTEFACT ?LICENSE)
(hasLicense ?ARTEFACT ?LICENSE)

(isa ?SOFTWARE softwareCodeBase)
(softwareReleaseFn ?SOFTWARE)
(softwareVersionFn (softwareReleaseFn ?SOFTWARE))

(hasDocumentation ?RELEASE ?DOCUMENT)'

(rendersObselete ?CODEBASE1 ?CODEBASE2)

(codeBaseProvidesSomeFeatures ?CODEBASE ?PROJECT)

(isa '(isReading ?AGENT ?DOCUMENT) Event)
(isa isReading EventPredicate)

(isa ?COMPANY SoftwareCompany)
(isa ?UNIVERSITY University)

(URLContainsSoftwareMetasite )


;; relations between software systems
(isa CodeBase Collection)
(isa FRDCSASystem Lattice)
(isa FRDCSAProject Lattice)
(isa Requirement Capability)
(isa Feature Capability)

(satisfiesAllRequirements ?FRDCSASystem ?FRDCSAProject)
(codeBaseIsPartOf ?CodeBase ?FRDCSASystem)
(codeBaseIsPartOf ?CodeBase ?FRDCSASystem)

(readDuringSleep ?Document)