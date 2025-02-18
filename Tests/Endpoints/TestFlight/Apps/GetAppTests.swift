//
//  GetAppTests.swift
//  AppStoreConnect-Swift-SDK_Tests
//
//  Created by Pascal Edmond on 23/11/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest
@testable import AppStoreConnect_Swift_SDK

final class GetAppTests: XCTestCase {

    func testURLRequest() {
        let endpoint = APIEndpoint.app(
            withId: "appId",
            select: [
                .apps(GetApp.Field.App.allCases),
                .appInfos(GetApp.Field.AppInfo.allCases),
                .appStoreVersions(GetApp.Field.AppStoreVersion.allCases),
                .betaLicenseAgreements(GetApp.Field.BetaLicenseAgreement.allCases),
                .preReleaseVersions(GetApp.Field.PreReleaseVersion.allCases),
                .betaAppReviewDetails(GetApp.Field.BetaAppReviewDetail.allCases),
                .betaAppLocalizations(GetApp.Field.BetaAppLocalization.allCases),
                .builds(GetApp.Field.Build.allCases),
                .betaGroups(GetApp.Field.BetaGroup.allCases)],
            include: GetApp.Relationship.allCases,
            limits: [
                .preReleaseVersions(2),
                .builds(3),
                .betaGroups(4),
                .betaAppLocalizations(5)])

        let request = try? endpoint.asURLRequest()
        XCTAssertEqual(request?.httpMethod, "GET")

        let absoluteString = request?.url?.absoluteString
        let expected = "https://api.appstoreconnect.apple.com/v1/apps/appId?fields%5BappInfos%5D=app%2CappInfoLocalizations%2CappStoreAgeRating%2CappStoreState%2CbrazilAgeRating%2CkidsAgeBand%2CprimaryCategory%2CprimarySubcategoryOne%2CprimarySubcategoryTwo%2CsecondaryCategory%2CsecondarySubcategoryOne%2CsecondarySubcategoryTwo&fields%5BappStoreVersions%5D=ageRatingDeclaration%2Capp%2CappStoreReviewDetail%2CappStoreState%2CappStoreVersionLocalizations%2CappStoreVersionPhasedRelease%2CappStoreVersionSubmission%2Cbuild%2Ccopyright%2CcreatedDate%2Cdownloadable%2CearliestReleaseDate%2CidfaDeclaration%2Cplatform%2CreleaseType%2CroutingAppCoverage%2CusesIdfa%2CversionString&fields%5Bapps%5D=betaAppLocalizations%2CbetaAppReviewDetail%2CbetaGroups%2CbetaLicenseAgreement%2CbetaTesters%2Cbuilds%2CbundleId%2Cname%2CpreReleaseVersions%2CprimaryLocale%2Csku&fields%5BbetaAppLocalizations%5D=app%2Cdescription%2CfeedbackEmail%2Clocale%2CmarketingUrl%2CprivacyPolicyUrl%2CtvOsPrivacyPolicy&fields%5BbetaAppReviewDetails%5D=app%2CcontactEmail%2CcontactFirstName%2CcontactLastName%2CcontactPhone%2CdemoAccountName%2CdemoAccountPassword%2CdemoAccountRequired%2Cnotes&fields%5BbetaGroups%5D=app%2CbetaTesters%2Cbuilds%2CcreatedDate%2CisInternalGroup%2Cname%2CpublicLink%2CpublicLinkEnabled%2CpublicLinkId%2CpublicLinkLimit%2CpublicLinkLimitEnabled&fields%5BbetaLicenseAgreements%5D=agreementText%2Capp&fields%5Bbuilds%5D=app%2CappEncryptionDeclaration%2CbetaAppReviewSubmission%2CbetaBuildLocalizations%2CbetaGroups%2CbuildBetaDetail%2CexpirationDate%2Cexpired%2CiconAssetToken%2CindividualTesters%2CminOsVersion%2CpreReleaseVersion%2CprocessingState%2CuploadedDate%2CusesNonExemptEncryption%2Cversion&fields%5BpreReleaseVersions%5D=app%2Cbuilds%2Cplatform%2Cversion&include=appInfos%2CappStoreVersions%2CbetaAppLocalizations%2CbetaAppReviewDetail%2CbetaGroups%2CbetaLicenseAgreement%2Cbuilds%2CpreReleaseVersions&limit%5BbetaAppLocalizations%5D=5&limit%5BbetaGroups%5D=4&limit%5Bbuilds%5D=3&limit%5BpreReleaseVersions%5D=2"
        XCTAssertEqual(absoluteString, expected)
    }
}
