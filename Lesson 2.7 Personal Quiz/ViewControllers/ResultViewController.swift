//
//  ResultViewController.swift
//  Lesson 2.7 Personal Quiz
//
//  Created by Psycho on 07.07.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var animalLabel: UILabel!
    @IBOutlet var animalDescribeLabel: UILabel!
    
    var answers: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAnimalLabel()
        getDefinitionLabel()
        backButtonHide()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
}

extension ResultViewController {
    
    private func getAnimalsArray() -> [Character] {
        var animalsInAnswers: [Character] = []
        for animal in answers {
            animalsInAnswers.append(animal.animal.rawValue)
        }
        return animalsInAnswers
    }
    
    private func getMostCommonAnimal() -> String? {
        var animal: String?
        var answersDictionary: [Character : Int] = [:]
        var maxValue = 0
        
        getAnimalsArray().forEach { (element) in
            if let count = answersDictionary[element] {
                answersDictionary[element] = count + 1
            } else {
                answersDictionary[element] = 1
            }
        }
        
        for (key, value) in answersDictionary {
            if value > maxValue {
                maxValue = value
                animal = String(key)
            }
        }
        return animal
    }
    
    private func getAnimalLabel() {
        guard let animal = getMostCommonAnimal() else { return }
        animalLabel.text = "Вы - \(animal)"
    }
    
    private func getDefinitionLabel() {
        if getMostCommonAnimal() == String(Animal.dog.rawValue) {
            animalDescribeLabel.text = Animal.dog.definition
        } else if getMostCommonAnimal() == String(Animal.cat.rawValue) {
            animalDescribeLabel.text = Animal.cat.definition
        } else if getMostCommonAnimal() == String(Animal.rabbit.rawValue) {
            animalDescribeLabel.text = Animal.rabbit.definition
        } else {
            animalDescribeLabel.text = Animal.turtle.definition
        }
    }
    
    private func backButtonHide() {
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
}

