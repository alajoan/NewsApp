//
//  SummayModelTests.swift
//  ProjBornlogicTests
//
//  Created by Jonathan Alajoan Nascimento Rocha on 16/08/2022
//

import XCTest

class SummaryModelTests: XCTestCase {

    func testSummaryModel_isArticleValid() {
        let articles = [
            Articles(
                title: "Apple and facebook hate each other",
                description: "They battle to get more money on fortnite",
                urlToImage: "https://www.google.com",
                publishedAt: "2022-16-08",
                content: "Content is needed"
            ),
            Articles(
                title: "New Title",
                description: "New description",
                urlToImage: "https://www.google.com",
                publishedAt: "2022-05-17",
                content: "super content"
            )
        ]
        
        let instance = SummaryRoot(articles: articles)
        
        XCTAssertTrue(instance.isArticleValid(), "The article should return true but it returned false")
    }
    
    func testSummaryModel_ShouldPassIfTitleIsValid() {
        let model = Articles(title: "Facebook and apple battle about fortnite")
        
        XCTAssertTrue(model.isTitleValid(), "The title test should return true but it returned false")
    }
    
    func testSummaryModel_ShouldPassIfTitleIsNotValid() {
        let model = Articles(title: "a")
        
        XCTAssertFalse(model.isTitleValid(), "The title test should return false but it returned true")
    }
    
    func testSummaryModel_isDescriptionValid() {
        let instance = Articles(description: "the description of an article must have more than 1 character")
        
        XCTAssertTrue(instance.isDescriptionValid(), "The description test should return true but it returned false")
    }
    
    
}
