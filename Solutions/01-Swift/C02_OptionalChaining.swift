// Solution · Challenge 02 · Optional Chaining

struct Address {
    var city: String
    var postcode: String?
}

struct Company {
    var name: String
    var headquarters: Address?
}

struct Worker {
    var name: String
    var employer: Company?
}

func headquartersCity(of worker: Worker) -> String? {
    worker.employer?.headquarters?.city
}

func postcodeLength(of worker: Worker) -> Int? {
    worker.employer?.headquarters?.postcode?.count
}

func shoutedEmployerName(of worker: Worker) -> String {
    worker.employer?.name.uppercased() ?? "UNEMPLOYED"
}
