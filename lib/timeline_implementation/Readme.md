Imagine you have a repo with the following branches.
```
1-lesson-one
2-lesson-two
3-lesson-three
...
10-lesson-ten
```
And each lesson builds on the source code of the previous.

```
Some times changes are needed in lesson plans. For instance, a function is mrege is implemented in lesson 3. This function is misspelled and should be corrected to merge in lessons 3 through 10. The function does not need to be merged into lesson 1 or 2 because the function (or concept) was not introduced there.
```

<br>not giving the options any options,
<br>the script would automatically use the last commit on the specified branch.

Im thinking about setting this up with commit hooks.
<br>Therefore, every time a commit occurs it is automatically ported to the correct branch.

and the only time a user would be running the script is to enable or disable the commit hook feature.

## Features that I can build right away.
1) Feature: find out if branches tell me the day they were created. this allows associations to build automatically.
<br>This feature is very niche as it only fits for a project that will not have any branch deviation.
<br>It should probably be built with an added feature where you can go into the text file and ignore specific branches.

2) Feature: 'git log' grepping. to get some intelligent information about the commit's on each branch.
<br> this could include ranges. It would be implemented by performing two greps, on each commit sha ... getting those two line numbers and then grabbing the sha's at each line in that range individually and making those specific changes.

## The next question that needs answers and defining before able to continue.
1) are we merging or cherry picking?
2) In my opinion cherry picking makes the most sense. because automating and something goes wrong there could be a merge hell! Which is not just a merge conflict but a whole branch of commits played on top of a whole branch of commits. (worst case 20 commit project turns into 400 commits, whaaa? 😆, that will not happen with this application.)

## Here is the plan,

cherry pick by default
but you can set it to merge on this occurrence with a --merge option.
