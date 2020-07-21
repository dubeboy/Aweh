//
// Post.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation

public struct Post: Codable {
    public var id: UUID
    /** post content */
    public var body: String
    /** times and date of post */
    public var timestamp: String?
    /** ID of user that&#x27;s posting */
    public var authorId: String?
    /** username of user that&#x27;s posting */
    public var authorName: String
    /** unique identifier of thr user&#x27;s profile picture */
    public var authorProfilePicUUID: String?
    public var interest: Interest?
    public var media: Media?
    public var comments: [Comment]?
    /** True or false value of whether the post is an emergency or not */
    public var isEmergency: Bool?
    /** True or false value to track whether post is reported/flagged */
    public var isFlagged: Bool?
    /** True or false value to stating whether user has deleted their post */
    public var isDeleted: Bool?
    /** Number dictating how many hours on main page user&#x27;s post get to stay */
    public var timeLimit: Double?
}
