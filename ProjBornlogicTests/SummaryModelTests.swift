//
//  SummayModelTests.swift
//  ProjBornlogicTests
//
//  Created by Jonathan Alajoan Nascimento Rocha on 16/08/22
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
    
    func testSummaryModel_ShouldPassIfDescriptionIsValid() {
        let instance = Articles(description: "the description of an article must have more than 1 character")
        
        XCTAssertTrue(instance.isDescriptionValid(), "The description test should return true but it returned false")
    }
    
    func testSummaryModel_ShouldPassIfDescriptionIsNotValid() {
        let instance = Articles(description: "xxx")
        	
        XCTAssertFalse(instance.isDescriptionValid(), "The description test should return false but it returned true")
    }
    
    func testSummaryModel_ShouldPassIfUrlToImageIsValid() {
        let instance = Articles(urlToImage: "https://dhbiuzu7sx6b3.cloudfront.net/assets/article/2020/08/25/world-of-warcraft-rp-entrega-especial_feature.jpg")
        XCTAssertTrue(instance.urlToImageValid())
    }
    
    func testSummaryModel_ShouldPassIfUrlToImageIsNotValid() {
        let instance = Articles(urlToImage: "https://ak")
        XCTAssertFalse(instance.urlToImageValid())
    }
    
    func testSummaryModel_ShouldPassIfPublishedAtIsValid() {
        let instance = Articles(publishedAt: "2022-08-18T11:33:00Z")
        XCTAssertTrue(instance.publishedAtValid())
    }
    
    func testSummaryModel_ShouldPassIfPublishedAtIsNotValid() {
        let instance = Articles(publishedAt: "12/03/2020")
        XCTAssertFalse(instance.publishedAtValid())
    }
    
    func testSummaryModel_ShouldPassIfContentIsValid() {
        let instance = Articles(content: "This is an example of how a atleast an article content should be")
        XCTAssertTrue(instance.contentValid())
    }
    
    func testSummaryModel_ShouldPassIfContentIsNotValid() {
        let instance = Articles(content: "this")
        XCTAssertFalse(instance.contentValid())
    }
    
    func testSummaryModel_ShouldPassIfAuthorIsValid() {
        let instance = Articles(author: "Mark Hunt")
        XCTAssertTrue(instance.authorValid())
    }
    
    func testSummaryModel_ShouldPassIfAuthorIsNotValid() {
        let instance = Articles(author: "xxx")
        XCTAssertFalse(instance.authorValid())
    }
       
}
