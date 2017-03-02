Class Solution {
    var characters = [String]()
    var lPFrom = 0, lPLen: Int = 0
    func longestPalindrome(_ s: String) -> String {
        characters = s.characters.map {String($0)}
        let len = characters.count
        if(len < 2) {
            return s
        }
        for i in 0...len {
            extentToTwoSides(characters, i, i)
            extentToTwoSides(characters, i, i + 1)
        }
        return characters[lPFrom..<lPFrom + lPLen].joined(separator: "")
    }
    
    func extentToTwoSides(_ characters: [String], _ lIndex: Int, _ rIndex: Int) {
        var k = lIndex, j = rIndex
        let len = characters.count
        while (k >= 0 && j < len) {
            if(characters[k] != characters[j]) {
                break
            }
            k = k - 1
            j = j + 1
        }
        if (j - k - 1 > lPLen) {
            lPLen = j - k - 1
            lPFrom = k + 1
        }
    }
}
