//
//  Numbers.swift
//  Swift3PracticePackageDescription
//
//  Created by Carl Bolstad on 2/16/18.
//

import Foundation

public class Numbers {
    
    //inefficient bottom up, brute force O(n)
    public static func squareRoot1(_ number: Float) -> Float {
        var answer: Float = 1
        while true {
            if answer * answer == number {
                return answer
            } else {
                answer += 1
            }
        }
    }
    
    public static func squareRoot2(_ number: Float) -> Float {
        var guess = number
        var nextGuess: Float = 0.0
        while guess != nextGuess {
            nextGuess = 0.5 * (guess + (number / guess))
        }
        return 1
    }
}
