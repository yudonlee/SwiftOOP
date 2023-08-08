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
    var mult: [Int] = []
    
    // TODO: isPrime 함수 리팩토링
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
    }
    
    func find(max: Int) -> [Int] {
        self.prepare()
        var candidate = 1
        
        while primes.count <= max {
            candidate += 2
            if self.isPrime(candidate) {
                primes.append(candidate)
            }
        }
        return primes
    }
}

class NumberPrinters {
    let rowsPerPage: Int
    let columnsPerPage: Int
    var primes: [Int] = []
    var primesCount = 0
    
    init(rowsPerPage: Int, columnsPerPage: Int) {
        self.rowsPerPage = rowsPerPage
        self.columnsPerPage = columnsPerPage
    }
    
    private func printPageHeader(pageNumber: Int) {
        print("The First \(self.primesCount) Prime Numbers --- page \(pageNumber)")
    }
    
    private func printPageBody(pageOffset: Int) {
        for rowOffset in pageOffset..<(pageOffset + self.rowsPerPage) {
            for columnOffset in 0..<self.columnsPerPage {
                if rowOffset + columnOffset * self.rowsPerPage <= self.primesCount {
                    let num = String(format: "%10d", self.primes[rowOffset + columnOffset * self.rowsPerPage])
                    print("\(num)", terminator: "")
                }
            }
            print("")
        }
    }
    
    private func prepare(_ primes: [Int]) {
        self.primes = primes
        self.primesCount = primes.count - 1
    }
    
    func printNumbers(_ primes: [Int]) {
        self.prepare(primes)
        var pageNumber = 1
        var pageOffset = 1

        while pageOffset <= primesCount {
            printPageHeader(pageNumber: pageNumber)
            printPageBody(pageOffset: pageOffset)
            
            pageNumber = pageNumber + 1
            pageOffset = pageOffset + rowsPerPage * columnsPerPage
        }
    }
}

class PrintPrimes {
    static func main() {
        let primes = PrimeFinders().find(max: 1000)
        assert(primes.count == 1001)
        assert(primes.last! == 7919)
        let printers = NumberPrinters(rowsPerPage: 50, columnsPerPage: 4)
        printers.printNumbers(primes)
    }
}


PrintPrimes.main()
