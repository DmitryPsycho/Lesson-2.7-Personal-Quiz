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
    
    private var animalsInAnswers: [Character] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAnimalArray()
        getAnimalLabel()
        getDefinitionLabel()
        backButtonHide()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
    deinit {
        print("ResultViewController has been deallocated")
    }
}

extension ResultViewController {
    private func getAnimalArray() {
        for answer in answers {
            animalsInAnswers.append(answer.animal.rawValue)
        }
    }
    
    private func getMostCommonAnimal(inArray animals: [Character]) -> String? {
        var animal: String?
        var answersDictionary: [Character : Int] = [:]
        animals.forEach { (element) in
            if let count = answersDictionary[element] {
                answersDictionary[element] = count + 1
            } else {
                answersDictionary[element] = 1
            }
        }
        var maxValue = 0
        for (key, value) in answersDictionary {
            if value > maxValue {
                maxValue = value
                animal = String(key)
            }
        }
        return animal
    }
    
    private func getAnimalLabel() {
        guard let animal = getMostCommonAnimal(inArray: animalsInAnswers) else { return }
        animalLabel.text = "Вы -  \(animal)"
    }
    
    private func getDefinitionLabel() {
        if getMostCommonAnimal(inArray: animalsInAnswers) == String(Animal.dog.rawValue) {
            animalDescribeLabel.text = Animal.dog.definition
        } else if getMostCommonAnimal(inArray: animalsInAnswers) == String(Animal.cat.rawValue) {
            animalDescribeLabel.text = Animal.cat.definition
        } else if getMostCommonAnimal(inArray: animalsInAnswers) == String(Animal.rabbit.rawValue) {
            animalDescribeLabel.text = Animal.rabbit.definition
        } else if getMostCommonAnimal(inArray: animalsInAnswers) == String(Animal.turtle.rawValue) {
            animalDescribeLabel.text = Animal.turtle.definition
        }
    }
    
    private func backButtonHide() {
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
}

