import Cocoa
import Combine

//값 발행을 위한 Publisher
let publisher = Just("Zedd")

//값을 받을 수 있는 Subcriber
let subscriber = publisher.sink { value in
    print(value)
}

let subscriber2 = publisher.sink { result in
    switch result { //2
    case .finished:
        print("finished")
    case .failure(let error):
        print(error.localizedDescription)
    }
} receiveValue: { value in
    print(value) //1
}

