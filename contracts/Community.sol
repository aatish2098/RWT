// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Community {
    struct Post {
        uint256 id;
        address author;
        string content;
        uint256 upvotes;
    }

    uint256 public postCount;
    mapping(uint256 => Post) public posts;

    event PostCreated(uint256 id, address author, string content);
    event PostUpvoted(uint256 id);

    function createPost(string memory content) public {
        postCount++;
        posts[postCount] = Post(postCount, msg.sender, content, 0);
        emit PostCreated(postCount, msg.sender, content);
    }

    function upvotePost(uint256 postId) public {
        posts[postId].upvotes++;
        emit PostUpvoted(postId);
    }
}
