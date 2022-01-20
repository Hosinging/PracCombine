import Cocoa
import Combine

//MARK: 구현 예1
let empty = Empty<String, Never>()
empty
    .sink(receiveCompletion: { print("completion: \($0)") }, receiveValue: { print("value: \($0)")})

//completion: finished

//MARK: 구현 예2
let anyPublisher = [1, nil, 3].publisher
    .flatMap { value -> AnyPublisher<Int, Never> in
        if let value = value {
            return Just(value).eraseToAnyPublisher()
        } else {
            return Empty().eraseToAnyPublisher()
        }
    }.eraseToAnyPublisher()

anyPublisher
    .sink(receiveCompletion: { print("AnyPublisher completion: \($0)")}, receiveValue: {print("value: \($0)")})

/*
 value: 1
 value: 3
 AnyPublisher completion: finished
 */
