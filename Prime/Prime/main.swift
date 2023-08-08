//
//  main.swift
//  Prime
//
//  Created by bearkode on 14/07/2019.
//  Copyright © 2019 bearkode. All rights reserved.
//

import Foundation


class PrintPrimes {
    static func main() {
        
        let primes = self.findPrimeNumbers(max: 1000)
        self.printPrimeNumbers(primes)
    }
    
    static func findPrimeNumbers(max: Int) -> [Int] {
        var primes: [Int] = Array<Int>(repeating: 0, count: max + 1)
        var candidate: Int = 0
        var numberOfPrimes: Int = 0
        var isPrime: Bool = false
        var ord: Int = 0
        var square: Int = 0
        var n: Int = 0 
        let ORDMAX = 30
        var mult: [Int] = Array<Int>(repeating: 0, count: ORDMAX + 1)
        
        // 후보자
        candidate = 1
        // 찾은 소수 개수
        numberOfPrimes = 1
        // 첫번째 소수
        primes[1] = 2
        // ??
        // ord의 역할은 최대 공약수를 ㅡ이미 ?
        ord = 2
        // 제곱
        square = 9
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
        
        return primes
    }
    
    static func printPrimeNumbers(_ primes: [Int]) {
        let RR = 50
        let CC = 4
        let max = 1000
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
