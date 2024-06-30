# 2024-06-30
Proshop er rasende ligeglade, så indtil jeg for skaffet en ny CPU har jeg nu prøvet sætte den til `Eco-mode (65 Watt)` i bios for at se om det gør den mere stabil.

## 2024-03-15
Hej Proshop

Denne AMD 5900X CPU jeg købte november 2023 har været en stor kilde til frustration. Den er sporadisk ustabil under nogle loads og på trods af at have prøvet alle mulige løsninger fra reddit og internettet kan jeg ikke få den til at være stabil.

Mit setup
* Windows 10 Pro 22H2
* RAM: 32 GB DDR4 @ 1600MHz
* Motherboard: MPG X570 GAMING EDGE WIFI
* CPU: AMD Ryzen 9 5900X CPU - 12 kerner - 3.7 GHz - AMD
* GPU: RTX 4070
* PSU: be quiet! Straight Power 11 850W
* Cooling: Et utal af Noctua kabine kølere og CPU køler

Helt konkret opstår mit problem under følgende omstændigheder
* Når jeg kører min Linux VM under VirtualBox genstarter Windows nogle gange efter et vist tidsrum, der kan variere mellem 5 minutter og flere timer. De samme VM med samme workload har kørt rock solid med min gamle AMD 3700X som jeg opgraderede fra.
* Nogle spil både, GPU intensive som Call of Duty, men også CPU intensive som Total War genstarter Windows også tilfældigt.
* Fælles for dem begge situationer er jeg ikke kan fremmane det situationen.
* Det sker næste aldrig ved normal browsing eller mails, så min teori er at det nogle specielle instruktioner der i stykker i min CPU, som kun rammes i nogen tilfælde.

Jeg har prøvet følgende
* Fuldt opdateret BIOS
* Fuldt opdateret chipset drivers under Windows
* Stress-testet CPU'en gennem CPU-Z med alle kerne på 100% uden at kunne fremprovokere en genstart.
* Temperaturene er i den forbindelse helt fornuftige omkring de 80C, så der er ikke cooling problem af CPU'en.
* Testet RAM uden problemer, men det ville også være underligt da de var stabile i 3 år med min 3700x.
* Ingen overclocking eller XMP RAM profiles
* Tilføjet ekstra cooling inklusiv 2x14cm Noctua fans i fronten
* Opgradet PSU til 850W for at sikre mig der var nok headroom.
* Jeg har prøvet at disable `Global C-states` i BIOS efter et rygte fra reddit om dette løste stabilitetsproblemet uden det hjalp.
* Jeg har sat PCIE speed til gen3 I BIOS, hvilket gjort at problemet sker lidt sjældnere, men det sker stadigt flere gange om ugen.

Kilder
* https://www.reddit.com/r/ryzen/comments/18rcs6u/ryzen_9_5900x_issues/
* https://www.reddit.com/r/ryzen/comments/yw0fmu/ryzen_9_5900x_crashes_with_12_cores_but_not_with/
* https://www.reddit.com/r/AMDHelp/comments/udk51y/5900x_freezingrestarting_no_bluescreen_when/