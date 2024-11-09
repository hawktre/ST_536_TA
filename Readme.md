# ST 536: R Programming for Data – TA Resources
**Trent VanHawkins**

**Fall 2024**

## Introduction
This is meant to serve as a folder structure of ST 536: R Programming for Data for the TA at Oregon State University. In addition to an organized folder structure for homework and project submissions, I included the `render_qmd.sh` folder to batch-render all quarto documents and output the rendered .pdf files to the provided folder path. 

## How to use this resource
Open the terminal on your local machine and navigate to where you would like to store this folder by running

```bash
cd ~/path/to/your/folder
```
Then, you can clone the contents of this repository to your local machine by running

```bash
git clone git@github.com:hawktre/ST_536_TA.git
```
Help with how to use and run setup for git and github on your machine are outside of the scope of this document, but you can use the [GitHub Help Documentation](https://docs.github.com/en/get-started). 

## How to use batch-render .qmd files (Mac)
Start by opening the terminal and change the working directory to wherever this folder is stored on your local machine. 

```bash
cd ~/path/to/this/ST_536_TA
```
Once you have successfully navigated to this folder and you will see the following structure (repeated for each homework and data analysis project)

```
ST_536_TA/
├── Homework/
│   └── Homework 1
│       └── Quarto
│       └── pdf_submit
│       └── pdf_render
├── Data Analysis/
│   └── DataAnalysis_1
│       └── Quarto
│       └── pdf_submit
│       └── pdf_render
└── render_qmd.sh
```
Students should submit a `.qmd` file and a `.pdf` file with each assignment. We need to render the `.qmd` files to ensure that they match up with the `.pdf` files (and sometimes they forget to submit the `.pdf` file altogether, so it is good practice)

My workflow for downloading, sorting, and rendering files is as follows. 

1. In Canvas, when you go to the assignment tab you will see "Download Submissions" in the top-right. Click to download the `.zip` file of all submissions (.pdf and .qmd)
2. Open the `.zip` file and sort by file type. Move `.qmd` files to the respective **Quarto** folder for that assignment and the `.pdf` file to its respective **pdf_submit** folder. 
3. If there is an associated `*.csv` file with the assignment, be sure to download it and put it in the **Quarto** folder so that the assignments will render properly.

Once you have followed these steps, return to the terminal and run the following command

```zsh
./render_qmd.sh ./Homework/HomeworkX/Quarto ./Homework/HomeworkX/pdf_render ./Homework/HomeworkX/Quarto/render_log.txt
```
Replacing 'X' with the relevant homework number or replacing the path name with the appropriate directories for Data Analysis projects. This will render every `.qmd` document in your **Quarto** folder and output the `.pdf` to the **pdf_render** folder. It will also create a `render_log.txt` file that will track the render status of each file. 