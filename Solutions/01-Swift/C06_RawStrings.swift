// Solution · Challenge 06 · Raw Strings

import Foundation

let windowsPath = #"C:\Users\Taylor\Documents"#

let digitsPattern = #"\d+"#

func sayingQuote(_ text: String) -> String {
    #"He said "\#(text)""#
}

func containsDigits(_ text: String) -> Bool {
    text.range(of: digitsPattern, options: .regularExpression) != nil
}
