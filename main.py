from fastapi import FastAPI
from typing import List, Dict
import json



app = FastAPI()
# test data
@app.post("/transform")
async def transform_data(data: List[Dict[str, str]]):
    # Group the posts by user id
    groupedPosts = {}
    for post in data:
        userId = post['userId']
        if userId not in groupedPosts:
            groupedPosts[userId] = []
        groupedPosts[userId].append(post['title'])

    # Transform the grouped posts into the desired format
    transformedData = []
    for userId, titles in groupedPosts.items():
        transformedData.append({
            'userId': userId,
            'count': len(titles),
            'titles': titles,
        })
    return transformedData