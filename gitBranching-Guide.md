# Introduction to Git Branching
So you think you know everything about Git Bash and editing git repos? Hate to break it to you, but there is far more than three commands and the abject horrors of Vim to work with. In this file, I'll give you a crash course on branches in git, why we use them, and how to use them.
### Why Even Use branches?
You know that entering the following text in Git Bash submits and applies changes to the repo you cloned on your personal/work computer:
```
git add -A
git commit -m "sample_text"
git push
```
The changes made would be automatically applied to the **Main Branch** of the repo. those who pull from the repo would then have the changes on their computers as the cycle of development continues. Sometimes you might want to make changes without affecting the main branch. Perhaps you wish to create and share your own version of the repo that your collaborators can review and approve while providing feedback for said changes. If the idea of creating itterative clones sounds good to you, perhaps you and your team should try creating and merging branches in Github.

----------
### How to Create a Branch in Git
To begin the branching process, clone a repository you have access to and manually make changes to it *(add/remove/edit files)*. Then, right-click the root file of the repo and open Git Bash there. Once the console is open, you'll be making use of some new and familiar commands including:
```
git status
```
The console should return the changes you're about to make to the repo. *This command is optional*, but recommended to use at virtually any point while using Git Bash. This is where *add, commit, and push* would come into play, but branching requires a few extra steps first. Starting with:
```
git checkout -b new-branch
```
This is the first step of creating a brand new branch with a custom name. It's not officially part of the repo yet.

**Note:** We'll be using "new-branch" as a placeholder name for the branch created. Its name can be pretty much anything. Just make sure its one your team can understand

Now it's time to make it official. This will be similar to pushing changes the old fashioned way:
```
git add -A
git commit -m "sample_text_2:_sample_harder"
git push -- set-upstream origin new-branch
```
**Note:** If you attempt to enter just "git push" instead of the aformentioned command. Git Bash would tell you the proper upstream command to push your branch. Copy and paste it with the mouse/touchpad. Ctrl+C and Ctrl+V won't work here.

And with that, your branch is now an official separate build from the main repo.

----------

### The Git Has a New Branch! What Can I Do With it?
Now that we have it in place, a branch can either be worked on separately from the other branches or merged into another branch. The the puropse of this guide, we'll be focused on the later.

A **Pull Request** can be performed on the Git Hub website itself, so no shell commands are involved in this part. On the repo you cloned, click on **Pull Requests** followed by **New Pull Request**. Choose to merge your branch to another one (usually the main one) and add details in the description. You can call out specific members of your group through this. Once the request is submitted, its up to your team to review and either approve or reject your changes.

----------
### Hacking Off Local Branches
Let's assume your branch has been approved for merging and the deed has been done. Now what? If you've done some looking around on the repo page, your branch is still there. Let's asssume some time has passed and the branch was left untouched. It's outdated now and keeping it there could cause confusion, project bloat, and/or anoying your peers after noticing their small project has well over 100 branches. It's time you learn how to delete outdated/stale branches. 

right-click the root file of the repo and open Git Bash there. Git pull. Then make sure how many branches there are by submitting the command:
```
git branch
```
The console should return your branch, *branch_name* amongst others. Now delete it with:
```
git branch -d branch_name
```
With *branch_name* replaced with the actual name of your branch. Just like that, your local files just got a little bit cleaner with that stale branch locally chopped off. However, there's still one loose end to take care of to truly make it official.

### Hacking off Remote Branches in the Repo

This is where you delete old/stale branches on the original repo you cloned earlier. Find the name of the branch you want to delete on the repo seen on the Github website
```
git push -d origin name-of-branch-to-delete
```
Replacing "name-of-branch-to-delete" with the actual name of said branch. If you need help remembering, remember that **-d** stands for **delete** in these scenarios.

**Note:** You cannot delete a branch you're currently in. You must navagate out to a different branch you find yourself in that situation. This is performed with *git checkout branch_name*. More details in the next segment.

This properly removes the branch from the repo seen on the Github website. Doing both of these steps should remove all traces of the branch that hasn't been merged with any other existing branches. You can choose to only do one or the other. It ultimately depends on the context. I personally see the cycle of the Github repo as such:

Repo is Created -> Clone -> Make Changes to Clone -> Create Branch -> Create Pull Request -> Process Request -> Repeat Steps 3 Through 6 -> Branch Becomes Outdated/Stale -> Delete Local/Remote Branch -> Go Back to Step 3 (Or Step 2 if you weren't on the original development team)


----------

### Navigating Branches in Git Bash
These commands are technically not required for just creating and submitting branches, but rather looking at other branches in Git Bash. You could also just use the website, but this is cool too.
```
git checkout branch_name
```
Using **git checkout** without **-b** or **-d** results in you entering that branch in Git Bash. If you wish to return to the main branch, enter:
```
git checkout main
```

----------
### When in Vim, do as Vim Does
As you might remember from a previous class or the first paragraph in this file, there's a non-zero chance you might somehow end up in the vim editor. I am not knowlagable in how this thing works or why wrangling with the controls is the way it is. What I do know is how to get out of there:

**Press the [ESC] key, then type :wq, then press the [ENTER] key**

If you need more assistance with Vim, consult your professor or the internet. The extent of my knowlege is at branches. That's why this is the branching guide and not the Vim guide. I'm sorry.

----------
### Tips and Closing Thoughts
Those should be the basics of branching in Git Bash and Git Hub. Remember, branching, just like the projects you undertake, is a collaborative effort. **Approving you own requests and leaving stale branches will hurt your team in the long run**, so try not to do that unless you have permission to do otherwise. If your requests are rejected, figure out why your changes aren't working out and ask your peers what you're missing or doing wrong. Failure can lead to the path to success, but you must learn to learn from it. This guide is meant to teach you all to collectively learn from it and keep at it.
