//
//  RulesViewController.swift
//  Alias
//
//  Created by Георгий Гречин on 04.05.2022.
//

import UIKit


class RulesViewController: UIViewController {
    

    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .systemBlue
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let scrollViewContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 10
        view.layer.borderWidth = 5
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        view.backgroundColor = .white
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let labelMainBold: UILabel = {
        let view = SSPaddingLabel()
        view.padding = UIEdgeInsets(top: 8, left: 15, bottom: 0, right: 15)
        view.font = .boldSystemFont(ofSize: 22)
        view.numberOfLines = 0
        view.sizeToFit()
        view.text = "Alias: Скажи иначе"
        return view
    }()
    
    let labelMain: UILabel = {
        let view = SSPaddingLabel()
        view.padding = UIEdgeInsets(top: 0, left: 15, bottom: 8, right: 15)
        view.font = .systemFont(ofSize: 20)
        view.text = """
            В игру играют командами из двух и более человек. Задача каждого игрока команды - объяснить как можно больше слов отображаемых на экране за ограниченное время другими словами, используя например синонимы, антонимы и подсказки так, чтобы члены вашей команды смогли отгадать как можно больше слов прежде чем истечет время. Чем больше слов отгадала команда, тем больше она заработает баллов.
            """
        view.lineBreakMode = .byWordWrapping
        view.numberOfLines = 0
        view.sizeToFit()
        return view
    }()
    
    let labelWordBold: UILabel = {
        let view = SSPaddingLabel()
        view.padding = UIEdgeInsets(top: 8, left: 15, bottom: 0, right: 15)
        view.font = .boldSystemFont(ofSize: 22)
        view.text = "Объяснения слов"
        return view
    }()
    
    let labelWord: UILabel = {
        let view = SSPaddingLabel()
        view.padding = UIEdgeInsets(top: 0, left: 15, bottom: 8, right: 15)
        view.font = .systemFont(ofSize: 20)
        view.text = """
            Объясняя слова, важно помнить, что ответ должен быть именно такой, как написано на карточке. Например, если объясняется слово «качели-доска», игроки должны угадать именно это, недостаточно сказать только «качели». Можно сразу сказать, что угадываем два слова. Сначала объясняет первое, а потом переходим ко второму. (не забывая зафиксировать у своей команды уже угаданную первую или вторую часть). В итоге команда называет правильное сочетание и можно переходить к следующему слову.
            
            Нельзя использовать однокоренные слова. Т.е, если на карточке слово «качели», нельзя говорить «это то, на чем КАЧАЮТСЯ». Можно сказать, что «это всегда есть на детских площадках и на них высоко подлетают». Объясняя слово «самолет», нельзя говорить, что это «летающее средство», т.к. корень у этих слов один. За каждую подобную ошибку-оговорку, фишка команды возвращается на один ход назад на игровом поле.
            
            Но при этом можно использовать антонимы или синонимы. Причем, можно говорить «антоним слова «большой» (если на карточке слово маленький). Если попадается сложное слово, то его лучше временно пропустить его и объяснять, когда время закончится, чтобы не потратить все время на его объяснение.
            """
        view.lineBreakMode = .byWordWrapping
        view.numberOfLines = 0
        view.sizeToFit()
        return view
    }()
    
    let labelScoreBold: UILabel = {
        let view = SSPaddingLabel()
        view.padding = UIEdgeInsets(top: 8, left: 15, bottom: 0, right: 15)
        view.font = .boldSystemFont(ofSize: 22)
        view.text = "Начисление очков"
        return view
    }()
    
    let labelScore: UILabel = {
        let view = SSPaddingLabel()
        view.padding = UIEdgeInsets(top: 0, left: 15, bottom: 8, right: 15)
        view.font = .systemFont(ofSize: 20)
        view.text =
            """
            За каждое отгаданое слово команда получает одно очко, а за пропущенное или отгаданное с нарушением – штрафуется ( -1 очко).
            
            Если объясняющий игрок допускает ошибку – например, называет часть слова, указанного в карточке, слово не будет принято и команда потеряет 1 очко. Поэтому каждая команда должна внимательно слушать объяснения других команд. Если слово кажется слишком тяжелым, вы можете его пропустить, о помните, что за это вы потеряете очки. Однако, иногда это того стоит, так как вы можете сэкономить время.
            
            Победителем считается команда, набравшая необходимое для победы количество очков. Если на момент завершения победного раунда у команд одинаковое количество очков – проводится дополнительный раунд.
            """
        view.lineBreakMode = .byWordWrapping
        view.numberOfLines = 0
        view.sizeToFit()
        return view
    }()
    
    let labelEndBold: UILabel = {
        let view = SSPaddingLabel()
        view.padding = UIEdgeInsets(top: 8, left: 15, bottom: 0, right: 15)
        view.font = .boldSystemFont(ofSize: 22)
        view.text = "Самое важное"
        
        return view
    }()
    
    let labelEnd: UILabel = {
        let view = SSPaddingLabel()
        view.padding = UIEdgeInsets(top: 0, left: 15, bottom: 8, right: 15)
        view.font = .systemFont(ofSize: 20)
        view.text = """
            Это игра для вечеринки, и не стоит принимать правила слишков всерьез! Договоритесь между собой о том, насколько гибкими могут быть правила.
            """
        view.lineBreakMode = .byWordWrapping
        view.numberOfLines = 0
        view.sizeToFit()
        return view
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        scrollView.addSubview(scrollViewContainer)
        scrollViewContainer.addArrangedSubview(labelMainBold)
        scrollViewContainer.addArrangedSubview(labelMain)
        scrollViewContainer.addArrangedSubview(labelWordBold)
        scrollViewContainer.addArrangedSubview(labelWord)
        scrollViewContainer.addArrangedSubview(labelScoreBold)
        scrollViewContainer.addArrangedSubview(labelScore)
        scrollViewContainer.addArrangedSubview(labelEndBold)
        scrollViewContainer.addArrangedSubview(labelEnd)
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        scrollViewContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        scrollViewContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        scrollViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        scrollViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        // this is important for scrolling
        scrollViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true

        
    }
}

