//
//  main.swift
//  Prime
//
//  Created by bearkode on 14/07/2019.
//  Copyright © 2019 bearkode. All rights reserved.
//

import Foundation


class PrintPrimes {
    static let max = 1000
    static let ORDMAX = 30
    static var primes: [Int] = Array<Int>(repeating: 0, count: max + 1)
    static var candidate: Int = 0
    static var numberOfPrimes: Int = 0
    static var isPrime: Bool = false
    static var ord: Int = 0
    static var square: Int = 0
    static var n: Int = 0
    static var mult: [Int] = Array<Int>(repeating: 0, count: ORDMAX + 1)
    
    static func main() {
        numberOfPrimes = 1
        primes[1] = 2
        ord = 2
        square = 9
        
        getPrimeNumbers()
        printPrimeNumbers()
    }
    
    static func getPrimeNumbers() {
        while numberOfPrimes < max {
            repeat {
                candidate = candidate + 2
                if candidate == square {
                    ord = ord + 1
                    square = primes[ord] * primes[ord]
                    mult[ord - 1] = candidate
                }
                n = 2
                isPrime = true
                while n < ord && isPrime {
                    while mult[n] < candidate {
                        mult[n] = mult[n] + primes[n] + primes[n]
                    }
                    if mult[n] == candidate {
                        isPrime = false
                    }
                    n = n + 1
                }
            } while !isPrime
            numberOfPrimes = numberOfPrimes + 1
            primes[numberOfPrimes] = candidate
        }
    }
    
    static func printPrimeNumbers() {
        let RR = 50
        let CC = 4
        var pageNumber: Int = 0
        var pageOffset: Int = 0

        pageNumber = 1
        pageOffset = 1
        while pageOffset <= max {
            print("The First \(max) Prime Numbers --- page \(pageNumber)")
            for rowOffset in pageOffset..<(pageOffset + RR) {
                for c in 0..<CC {
                    if rowOffset + c * RR <= max {
                        let num = String(format: "%10d", primes[rowOffset + c * RR])
                        print("\(num)", terminator: "")
                    }
                }
                print("")
            }
            pageNumber = pageNumber + 1
            pageOffset = pageOffset + RR * CC
        }
    }

}


PrintPrimes.main()
