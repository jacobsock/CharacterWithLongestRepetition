//
//  ContentView.swift
//  CharacterWithLongestRepetition
//
//  Created by Jacob Sock on 3/23/23.
//

import SwiftUI

struct ContentView: View {
    @State var characterStringInput = ""
    @State var c = ""
    @State var l = 0
    var body: some View {
        VStack {
            TextField("Character String Input:", text: $characterStringInput)
            Button {
                //result is an array containing one dictionary element
                //The dictionary element key is the character that repeats the longest
                //The dicitonary element value is the length of the consequtive repetitions
                var result = longestRepetition(characterStringInput)
                //we can force unwrap value and key because our function will always return an with ONLY 1 value
                //We assign the key value to our character property
                c = result.first!.key
                //We assign the value value to our length property
                l = result.first!.value
            } label: {
                Text("Check Longest")
            }
            Text("Longest Character: \(c)")
            Text("Length: \(l)")
        }
        .padding()
    }
}

extension ContentView{
    
    ///This function takes in an argument 's' which is a String.
    ///The function then iterates over 's' in order to determine the longest consequetive string of characters that occurs.
    ///The function returns an array of type [String:Int] which will only ever contain one value.
    ///The one value will consist of a key value pair where the 'key' is the character which is the longest,  represented by the 'String' type; And the 'value' which is the length of the how many times that character repeats consequetively, represented by the 'Int' type.
    func longestRepetition(_ s: String) -> [String: Int]{
        
    //l & c are our two return values
      var l = 0
      var c = ""
    //counter is used to keep track of the longest consequtive string and update l accordingly
      var counter = 1
    //We use i to access the element in front of our current iteration -- probably a better way to do this
      var i = 0
    //We need the range to prevent overflow -- probably a better way to do this
      let range = s.count-1
      
      for character in s {

        //If we our out of range
        if(i+1 > range)
        {
          //If the counter is greater than our length counter we update our return variables
            if(counter > l){
           l = counter
           c = String(character)
         }
        }
        //If we are in range
        else
        {
          //If the next character is the same as our current character we increase our counter
        if character == Array(s)[ i+1] {
            counter += 1
        }
          
          else{
            //If it is not, we check if it is the longest, if so we update our return variables and reset counter to 1
           if(counter > l){
           l = counter
           c = String(character)
         }
          counter = 1
        }
        }
        i += 1
      }
      return [c:l]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
