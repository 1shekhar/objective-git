//
//  Libgit2FeaturesSpec.m
//  ObjectiveGitFramework
//
//  Created by Ben Chatelain on 7/6/15.
//  Copyright (c) 2015 GitHub, Inc. All rights reserved.
//

@import ObjectiveGit;
@import Nimble;
@import Quick;

#import "QuickSpec+GTFixtures.h"

QuickSpecBegin(Libgit2FeaturesSpec)

describe(@"libgit", ^{

	__block git_feature_t git_features = 0;

	beforeEach(^{
		git_features = git_libgit2_features();
	});

	it(@"should be built with THREADS enabled", ^{
		expect(@(git_features & GIT_FEATURE_THREADS)).to(beTruthy());
	});

	it(@"should be built with HTTPS enabled", ^{
		expect(@(git_features & GIT_FEATURE_HTTPS)).to(beTruthy());
	});

	it(@"should be built with SSH enabled", ^{
		expect(@(git_features & GIT_FEATURE_SSH)).to(beTruthy());
	});

	it(@"should have ssh memory credentials", ^{
		NSError *error;
		GTCredential *cred = [GTCredential credentialWithUserName:@"null" publicKeyString:@"pub" privateKeyString:@"priv" passphrase:@"pass" error:&error];

		expect(cred).notTo(beNil());
		expect(error).to(beNil());
	});
});

QuickSpecEnd
