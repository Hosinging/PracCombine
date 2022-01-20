import Cocoa
import Combine

let record = Record<String, Never>(output: ["ho", "horang", "horangi"], completion: .finished)

record
    .sink(receiveCompletion: { print("completion: \($0)")}, receiveValue: { print("value: \($0)")})

/*
 value: ho
 value: horang
 value: horangi
 completion: finished
 */
