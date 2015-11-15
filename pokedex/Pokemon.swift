//
//  Pokemon.swift
//  pokedex
//
//  Created by Mike Pitre on 11/6/15.
//  Copyright © 2015 Mike Pitre. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon
{
    private var _name: String!
    private var _pokedexId: Int!
    private var _desc: String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _attack: String!
    private var _nextEvolutionTxt: String!
    private var _nextEvolutionId: String!
    private var _nextEvolutionLvl: String!
    private var _pokemonUrl: String!
    
    var name: String
        {
        return _name
        }
    
    var  pokedexId: String
        {
        return "\(_pokedexId)"
        }
    
    var desc: String
        {
        return _desc
        }
    
    var type: String
        {
        return _type
        }
    
    var defense: String
        {
        return _defense
        }
    
    var height: String
        {
        return _height
        }
    
    var weight: String
        {
        return _weight
        }
    
    var attack: String
        {
        return _attack
        }
    
    var nextEvolutionTxt: String
        {
        if _nextEvolutionTxt == nil
            {
            return ""
            }
        else
            {
            return _nextEvolutionTxt
            }
        }
    
    var nextEvolutionId: String
        {
        if _nextEvolutionId == nil
            {
            return ""
            }
        else
            {
            return _nextEvolutionId
            }
        }
    
    var nextEvolutionLvl: String
        {
        if _nextEvolutionLvl == nil
            {
            return ""
            }
        else
            {
            return _nextEvolutionLvl
            }
        }
    
    init(name:String, pokedexId: Int)
        {
        self._name = name
        self._pokedexId = pokedexId
            
        _pokemonUrl = "\(URL_BASE)\(URL_POKEMON)\(self._pokedexId)/"
        }
    
    func downloadPokemonDetails(completed: DownloadComplete)
        {
        let url = NSURL(string: _pokemonUrl)!
        Alamofire.request(.GET, url).responseJSON
            {
            response in
            let result = response.result
            if let dict = result.value as? Dictionary<String, AnyObject>
                {
                if let defense = dict["defense"] as? Int
                    {
                    self._defense = "\(defense)"
                    }
                if let height = dict["height"] as? String
                    {
                    self._height = height
                    }
                if let weight = dict["weight"] as? String
                    {
                    self._weight = weight
                    }
                if let attack = dict["attack"] as? Int
                    {
                    self._attack = "\(attack)"
                    }
                    
                print(self._defense)
                print(self._height)
                print(self._weight)
                print(self._attack)
                    
                if let types = dict["types"] as? [Dictionary<String, String>] where types.count > 0
                    {
                    if let type = types[0]["name"]
                        {
                        self._type = type.capitalizedString
                        }
                    if types.count > 1
                        {
                        for var x = 1; x < types.count; x++
                            {
                            if let type = types[x]["name"]
                                {
                                self._type! += "/\(type.capitalizedString)"
                                }
                            }
                        }
                    } else
                        {
                        self._type = ""
                        }
                    
                print(self._type)
                    
                if let descArray = dict["descriptions"] as? [Dictionary<String, String>] where descArray.count > 0
                    {
                    if let url = descArray[0]["resource_uri"]
                        {
                        let nsurl = NSURL(string: "\(URL_BASE)\(url)")!
                        Alamofire.request(.GET, nsurl).responseJSON
                            {
                            response in
                            let descResult = response.result
                            if let descDict = descResult.value as? Dictionary<String, AnyObject>
                                {
                                if let description = descDict["description"] as? String
                                    {
                                    self._desc = description
                                    print(self._desc)
                                    }
                                }
                                completed()
                            }
                        }
                    }
                else
                    {
                    self._desc = ""
                    }
                
                if let evolutions = dict["evolutions"] as? [Dictionary<String, AnyObject>] where evolutions.count > 0
                    {
                    if let to = evolutions[0]["to"] as? String
                        {
                        if to.rangeOfString("mega") == nil
                            {
                            if let uri = evolutions[0]["resource_uri"] as? String
                                {
                                //not supporting mega evolutions, if evolution contains "mega" then ignore it
                                let newStr = uri.stringByReplacingOccurrencesOfString(URL_POKEMON, withString: "")
                                let num = newStr.stringByReplacingOccurrencesOfString("/", withString: "")
                                self._nextEvolutionId = num
                                self._nextEvolutionTxt = to
                                print(self._nextEvolutionTxt)
                                print(self._nextEvolutionId)
                                
                                if let lvl = evolutions[0]["level"] as? Int
                                    {
                                    self._nextEvolutionLvl = "\(lvl)"
                                    print(self._nextEvolutionLvl)
                                    }
                                }
                             }
                        }
                    }
                    
            }
        }
    }
}
