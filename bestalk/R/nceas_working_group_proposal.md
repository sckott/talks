





NCEAS working group proposal
=============

## Title: rOpenSci: Reproducible and open science
## Short title: Open Science

## WG leader names and contact
+ Carl Boettiger
    + email: cboettig@gmail.com
    + phone: 
    + address: EVE Dept, UC Davis 1 Shields Ave, Davis CA 95616
+ Karthik Ram
    + email: karthik.ram@gmail.com
    + phone: 
    + address: 
+ Scott Chamberlain
    + email: scott.sfu@gmail.com
    + phone: 713-364-5048
    + address: Simon Fraser University, 8888 University Dr., Burnaby, BC, Canada V5A 1S6

# rOpenSci: Reproducible and open science
## Summary
The proposed working group on Open Science will bring together some of the best minds in open science to layout a vision of open science. The scientific community is producing knowledge at a faster rate than ever, with output said to be doubling every five years (Mehlo et al.). Such knowledge is out of reach for most of the public since it exists in closed-access journals and repositories. Even the privileged subset who are able to access such scholarly output only see the end product (i.e. the journal article) and not other equally valuable products of scientific endeavors such as the raw data or workflows used to generate them. Providing free and open access to journal articles and the underlying data not only benefits a wider community but also promotes greater transparency in scientific research and facilitates reproducible research. Open science is a growing movement that seeks to make all outputs of the scientific process - data, software, analysis, results, & publications -- freely available to the public and researchers. Although the idea of open science is quite popular in the research community, few scientists follow that philosophy when it comes to their own research. Some challenges include social barriers such as lack of appropriate incentives and rewards. Another set of challenges are technical in nature which arise largely from issues of scale. Currently very few tools exist that allow a researcher to access data that are currently openly available.
	
The working group goals are three-fold: (1) write a manuscript on the opinions of ecologists and evolutionary biologists on open data and reproducible science; (2) write a manuscript that lays out a vision and action list of steps the scientific community needs to take to make science truly open and reproducible; and (3) create software libraries for the R programming language that will facilitate open science, including an R library to interact with DataONE.

We have put together a list of some of the leading minds in open science and leading developers of open science tools in the R programming language (see Table 1). NCEAS will bring this group of people together to provide a venue for creating a vision for open science, and the tools that will make it happen.

## Proposed start date
February 1, 2013

## Proposed end date
May 1, 2014

## Proposed data release date
We will have a completely open process. All writing of manuscripts, code, and documentation will be stored on GitHub for public viewing. This will also facilitate collaboration. The data from the survey will be open as soon as it is collected, and checked (and personal identifiers removed). 

## Is this a resubmission
No.

**************

## Problem Statement
At its heart, science is based on trust that results are reproducible (Peng, 2011). However, increasing retractions in high profile journals (Steen, 2010; Fang & Casadevall, 2011; Marcus & Oransky, 2011) are suggesting that science is not always reproducible. The best way to tackle reproducibility is to make science open: open as in the entire workflow, including data, code, methods, and publications. Making science open has knock-on effects beyond allowing others to test how reproducibile your science is. Sharing datasets results in increased citation rates (Piwowar _et. al._ 2007). In addition, doing science in the open has created collaborations that wouldn't have otherwise existed. For example, rOpenSci started by Carl and Scott noticing each other's open science blog posts exploring how to use the TreeBASE databse of phylogenetic trees - which started a snowball of open source code in R we now call rOpenSci. 

We will address the problem of open and reproducible science in three ways. First (1), we will conduct a survey of ecologists and evolutionary biologists (or all scientists?) to gauge the current state of opinion and practice of open science. This will turn into a manuscript that will be very useful in our second goal. Second (2), we will write a manuscript on how we can facilitate open and reproucible science. This manuscript will follow from a discussion at NCEAS with many great open science thinkers on how this goal can be achieved. Third (3), we will X. These three goals together will provide for the most thorough examination to date of open and reproducible science, and makes a significant contribution to the creation of open source tools to facilitate open science. 

## Proposed Activities
Our goal with the proposed series of meetings is to facilitate open and reproducible science. We will focus our efforts on three main areas. These three areas will be covered in two meetings, with (1) and (2) in the first meeting, and (3) in the second meeting.

### (1) *Write a manuscript on the opinions of ecologists and evolutionary biologists on open data and reproducible data*

*Motivating question - What is the current state of use of open data, and reproducible science tools?*

+ In order to gauge the extent of awareness of open and reproducible science in ecology and evolution we need to conduct a survey. This survey will facilitate the second proposed activity below, to lay out a vision for open and reproducible science. Here are some tentative questions:
	+ What software programs does your workflow consist of (e.g., Excel, Word, JMP, SAS, R, etc.)?
	+ What percentage of your data sets do you make public before and after funding?
	+ ?
+ We will survey as many ecologists and evolutionary biologists as possible using Survey Monkey or similar. We will advertise the survey on social media channels (Twitter, Google Plus, Facebook, blogs, and email) as well as within academic departments at universities. 
+ asdfasf

### (2) *Write a manuscript that lays out a vision for open and reproducible science, and action items that the scientific community needs to take to get there*

*Motivating question - How can we facilitate open and reproducible science?*

+ Science is a very closed process currently. The recent Reproducibility Initiative started by PLoS Journals, Figshare, and Science Exchange highlight this problem in science. Open science shows significant potential to increase reproducibility in science, as well as promote research findings more quickly, and facilitate collaboration. In our manuscript we will discuss: 
	+ The problem: Science is not generally reproducible
	+ How widespread is the problem?
	+ What are the tools needed to make science more reproducible?
+ The tools needed to make science more reproducible and open are key. We think the tools we are creating at rOpenSci are a significant contribution to open and reproducible science, particularly in dataset acquisition, text mining, and metadata acquisition. We will also discuss other R tools for writing, analysis and visualization. Many tools are available outside of the R environment that facilitate open and reproducible science, such as depositing data in open databases such as Dryad and Figshare, writing in LaTeX or markdown instead of Microsoft Word, and publishing in open source journals instead of journals behind pay walls. 

### (3) *Create software extensions to the R programming language that will facilitate open science*

*Motivation - Scientists need open source tools to do open and reproducible science*

+ rOpenSci already has many R packages to allow scientists to get data, literature, and metadata from many sources. However, as yet we don't have packages to facilitate cross source searches and acquisition. For example, a scientist may be interested in what data sets and papers are available for her study species. With a new package we will create at NCEAS called "rmetadata" she can search across many sources, including DataCite, PubMed Central, Dryad, Biodiversity Heritage Library, and more. In addition to metadata, we will focus on a package to search across datasets (e.g., from Figshare, Dryad, DataONE, etc.) and across full text literature (e.g., PLoS Journals, BMC Journals; and if available at the time: eLife, F1000 Research, and PeerJ). We are already in discussion with the eLife developers and their API will be ready in the next few months. APIs for F1000 Research and PeerJ are further out for public release, but will be likely be ready by the proposed  date of themeeting (November 2013).
+ At this meeting we will conduct a hackathon. We will have our core rOpenSci team at this meeting, as well as some of our advisory team, as well as other skilled R programmers. In addition, prior to the meeting we will put a public call out for interested people to join us remotely on Google Plus or other web interfaces. The in person programmers, along with remote programmers, will ensure that we can make significant progress on our packages in a short period of time.
+ We will develop the following R packages: 
	+ rmetadata: Search and retrieve data across metadata sources, including DataCite, PubMed Central, Dryad, Biodiversity Heritage Library, and more.
	+ rliterature: Search and retrieve full text across journals, including PLoS Journals, BMC Journals, eLife, and more.
	+ rdata: Search and retrieve data across 
	+ ropensci: Search and retrieve metadata, data, and full text literature across all sources we can connect with.
+ For each package we have the following goals:
	+ Complete package enough for submission to CRAN.
	+ Get good documentation done.
	+ Get tutorials up on ropensci.org, and blog posts up about each pacakge.

## Names of Participants
### Technical liaison for NCEAS computing staff.
+ Carl or Karthik?

### Participant who will be responsible for ensuring that the requirements of the NCEAS Data and Information Policy are met.
+ Scott Chamberlain

### Identify at least one graduate student participant.
+ Corey Chivers and Laura Trembly-Boyer

### Table 1. Participants for the working group. Confirmed participants are those with asterisks. Those without asterisks will likely come. 
<table border="1">
	<tr>
		<th>Participant</th>
		<th>Affiliation</th>
		<th>Expertise</th>
	</tr>
	<tr>
		<td>Carl Boettiger *</td>
		<td>rOpenSci, Univ. of California, Davis</td>
		<td>R, Open Science</td>
	<tr>
	<tr>
		<td>Karthik Ram *</td>
		<td>rOpenSci, Univ. of California, Berkeley</td>
		<td>R, Open Science</td>
	<tr>
		<td>Scott Chamberlain *</td>
		<td>rOpenSci, Simon Fraser University</td>
		<td>R, Open Science</td>
	</tr>
	<tr>
		<td>Ted Hart *</td>
		<td>rOpenSci, Univ. of British Columbia</td>
		<td>R, Python, Open Science</td>
	</tr>
	<tr>
		<td>Corey Chivers *</td>
		<td>McGill University</td>
		<td>R</td>
	</tr>
	<tr>
		<td>Laura Trembly-Boyer *</td>
		<td>Univ. of British Columbia</td>
		<td>R</td>
	</tr>
	<tr>
		<td>Holly Bik *</td>
		<td>Univ. of California, Davis</td>
		<td>Molecular Biology, Open Science</td>
	</tr>
	<tr>
		<td>Jen Lowe *</td>
		<td>Datatelling.com</td>
		<td>Open Science</td>
	</tr>
	<tr>
		<td>Karen Cranston *</td>
		<td>NESCent (National Evolutionary Synthesis Center)</td>
		<td>Open Science</td>
	</tr>
	<tr>
		<td>Hadley Wickham</td>
		<td>RStudio</td>
		<td>R</td>
	</tr>
	<tr>
		<td>Duncan Temple-Lang</td>
		<td>Univ. of California, Davis</td>
		<td>R</td>
	</tr>
	<tr>
		<td>Matt Jones</td>
		<td>NCEAS</td>
		<td>R, open science</td>
	</tr>
	<tr>
		<td>JJ Allaire</td>
		<td>RStudio</td>
		<td>R</td>
	</tr>
	<tr>
		<td>Bertram Ludäscher</td>
		<td>Univ. of California, Davis</td>
		<td>R, reproducible science</td>
	</tr>
</table>

## Timeline of activities.
### Table 2. Timeline.
<table border="1">
	<tr>
		<th>Meeting</th>
		<th>Objectives</th>
	</tr>
	<tr>
		<td>Prior to the first meeting</td>
		<td>We will...</td>
	</tr>
	<tr>
		<td>I. February 2013 - Open Science</td>
		<td>We will get together the entire list of participants to discuss 1) the vision for reproducible science - the tools, the workflows, and how to implement them, and 2) X. At this meeting we will begin writing one or two manuscripts on open science.</td>
	</tr>
	<tr>
		<td>II. November 2013 - Code Development</td>
		<td>Plan and write R packages for open science.</td>
	</tr>
</table>

## Anticipated Results and Benefits 
(Include description of data and software products and proposed public release date)

+ Publish one paper in an open access journal on the current use of open and reproducible science in ecology and evolution.
+ Publish one paper in an open access journal on our vision for open and reproducible science.
+ Create five R packages uploaded onto CRAN and open for public use. These packages will be 'umbrella' packages that will make for broad search and data acquisition across data categories (primary datasets, full text literature, journal metadata, DataONE).

## Indicate how you heard about the NCEAS Call for Proposals
Twitter.

## Is this proposal (or a closely aligned proposal) under consideration elsewhere (e.g., NESCent, SESYNC)? If so, please briefly describe the circumstances.
No.

## Literature Cited

```r
bibliography()
```

<p>Peng RD (2011).
&ldquo;Reproducible Research in Computational Science.&rdquo;
<EM>Science</EM>, <B>334</B>.
ISSN 0036-8075, <a href="http://dx.doi.org/10.1126/science.1213847">http://dx.doi.org/10.1126/science.1213847</a>.

<p>Steen RG (2010).
&ldquo;Retractions in The Scientific Literature: do Authors Deliberately Commit Research Fraud?&rdquo;
<EM>Journal of Medical Ethics</EM>, <B>37</B>.
ISSN 0306-6800, <a href="http://dx.doi.org/10.1136/jme.2010.038125">http://dx.doi.org/10.1136/jme.2010.038125</a>.

<p>Fang FC and Casadevall A (2011).
&ldquo;Retracted Science And The Retraction Index.&rdquo;
<EM>Infection And Immunity</EM>, <B>79</B>.
ISSN 0019-9567, <a href="http://dx.doi.org/10.1128/IAI.05661-11">http://dx.doi.org/10.1128/IAI.05661-11</a>.

<p>Marcus A and Oransky I (2011).
&ldquo;Science Publishing: The Paper is Not Sacred.&rdquo;
<EM>Nature</EM>, <B>480</B>.
ISSN 0028-0836, <a href="http://dx.doi.org/10.1038/480449a">http://dx.doi.org/10.1038/480449a</a>.

<p>Piwowar HA, Day RS, Fridsma DB and Ioannidis J (2007).
&ldquo;Sharing Detailed Research Data is Associated With Increased Citation Rate.&rdquo;
<EM>Plos One</EM>, <B>2</B>.
<a href="http://dx.doi.org/10.1371/journal.pone.0000308">http://dx.doi.org/10.1371/journal.pone.0000308</a>.


## Budget
### Table 3. The proposed budget. Total $33,334.
<table border="1">
	<tr>
		<th> </th>
		<th>Meeting I (Feb. '13)</th>
		<th>Meeting II (Nov. '13)</th>
	</tr>
	<tr>
		<td><b>Travel</b></td>
		<td> </td>
		<td> </td>
	</tr>
	<tr>
		<td>Western USA/Canada</td>
		<td> </td>
		<td> </td>
	</tr>
	<tr>
		<td>&nbsp;&nbsp;Participants</td>
		<td>8</td>
		<td>11</td>
	</tr>
	<tr>
		<td>&nbsp;&nbsp;Cost</td>
		<td>$3,600</td>
		<td>$4,950</td>
	</tr>
	<tr>
		<td>Easter USA/Canada</td>
		<td> </td>
		<td> </td>
	</tr>
	<tr>
		<td>&nbsp;&nbsp;Participants</td>
		<td>1</td>
		<td>1</td>
	</tr>
	<tr>
		<td>&nbsp;&nbsp;Cost</td>
		<td>$700</td>
		<td>$700</td>
	</tr>
	<tr>
		<td><b>Daily Expenditures</b></td>
		<td> </td>
		<td> </td>
	</tr>
	<tr>
		<td>&nbsp;&nbsp;6 days</td>
		<td>$9,936</td>
		<td>$13,248</td>
	</tr>
	<tr>
		<td><b>Total expenses</b></td>
		<td>$14,436</td>
		<td>$18,898</td>
	</tr>
</table>

## Curriculum Vitae for Each Working Group leader – Two (2) page maximum for each
+ For Carl, Karthik, and Scott
