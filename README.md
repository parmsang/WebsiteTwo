# Agile Ventures WebSiteTwo

Introduction
-------
A user friendly website for charities interested in receiving free web development help. This is a sister website for Agile Ventures, which is a website that offers web development experience to programmers in order to level-up their skills whilst working on real world projects for charities and non-profit organisations.

This was a 5-person team effort and produced as part of [MakersAcademy's](http://www.makersacademy.com/) final group project.

The client for this project was [Sam Joseph](https://github.com/tansaku), who is the man behind Agile Ventures.

Click [here](https://evening-oasis-1495.herokuapp.com/) to see the site.

Screenshot
-------

![alt text](https://github.com/ajitsy/websitetwo/blob/master/app/assets/images/agileventures.png)

How to Use
-------

```
$ git clone https://github.com/ajitsy/WebsiteTwo
$ cd WebsiteTwo
$ bundle install
$ rackup
```

Use Rspec to test it.

Technologies Used
-------
* Ruby on Rails
* PostgreSQL
* Rspec
* Capybara
* Paperclip
* HTML & CSS
* Paperclip
* Devise
* Amazon Web Services

Tests
-------
```
charity can sign in and out
  Charity not signed in and on the homepage
    should see a 'sign in' link and a 'sign up' link
    should not see 'sign out' link
  Charity signed in on the homepage
    should see 'sign out' link
    should not see a 'sign in' link and a 'sign up' link
    should take us to the charity's page

showcase
  no projects have been added
    should display a prompt to add a project
  project have been added
    display projects
  creating projects
    prompts user to fill out a form, then displays the new project
    it displays error when title/description/link is not valid
      title and description must be present
  editing projects
    have the option for edit
    there is a form with the previous information
    can edit showcase
  can delete projects from showcase
    have an option to delete
    can delete project

requests
  no charities have been added
    should display a prompt to add a charity
  charity have been added
    display charities
    the charity title is a link to the charity page
  editing charities
    have the option for edit when signed in as charity
    NOT have the option for edit when NOT signed in as charity
    there is a form with the previous information
    can edit showcase
  can close open projects
    have an option to close project
    can delete charity
  can view individual charity
    everything is on the page

Charity
  is not valid unless it has a title
  is not valid unless it has a project description

Project
  is not valid unless it has a title
  is not valid unless it has a description
```
