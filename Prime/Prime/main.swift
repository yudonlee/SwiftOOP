//
//  main.swift
//  Prime
//
//  Created by bearkode on 14/07/2019.
//  Copyright © 2019 bearkode. All rights reserved.
//

import Foundation


class PrimeFinders {
    var primes: [Int] = []
    var ord = 0
    var square = 9
    let ORDMAX = 30
    var candidate = 1
    var mult: [Int] = []
    
    private func isPrime(_ candidate: Int) -> Bool {
        if candidate == self.square {
            self.ord = self.ord + 1
            self.square = self.primes[ord] * self.primes[ord]
            self.mult[ord - 1] = candidate
        }
        
        var n = 2
        while n < ord {
            while mult[n] < candidate {
                mult[n] = mult[n] + primes[n] + primes[n]
            }
            if mult[n] == candidate {
                return false
            }
            n = n + 1
        }
        return true
    }
    
    private func prepare() {
        self.primes = [0, 2]
        self.ord = 2
        self.square = 9
        self.mult = Array<Int>(repeating: 0, count: ORDMAX + 1)
        self.candidate = 1
    }
    
    func find(max: Int) -> [Int] {
        self.prepare()
        
        while primes.count - 1 < max {
            candidate += 2
            if self.isPrime(candidate) {
                primes.append(candidate)
            }
        }
        return primes
    }
}

class NumberPrinters {
    func printNumbers(_ primes: [Int]) {
        let RR = 50
        let CC = 4
        let primesCount = primes.count - 1
        var pageNumber = 1
        var pageOffset = 1

        while pageOffset <= primesCount {
            print("The First \(primesCount) Prime Numbers --- page \(pageNumber)")
            for rowOffset in pageOffset..<(pageOffset + RR) {
                for c in 0..<CC {
                    if rowOffset + c * RR <= primesCount {
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

class PrintPrimes {
    static func main() {
        let primes = PrimeFinders().find(max: 1000)
        let printers = NumberPrinters()
        printers.printNumbers(primes)
    }
}


PrintPrimes.main()
