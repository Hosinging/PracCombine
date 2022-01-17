import Cocoa
import Combine

let just = Just("This is Output")
just
    .sink { completion in
        print("received completion: \(completion)")
    } receiveValue: { value in
        print("received value: \(value)")
    }

/*
 received value: This is Output
 received completion: finished
 */
