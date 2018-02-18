majorMyFRDCSA1p0Directories(['/var/lib/myfrdcsa/codebases/minor','/var/lib/myfrdcsa/codebases/internal','/var/lib/myfrdcsa/codebases/internal/source-hatchery','/var/lib/myfrdcsa/codebases/external','/var/lib/myfrdcsa/codebases/work','/var/lib/myfrdcsa/codebases/work/clients','/var/lib/myfrdcsa/codebases/work/work','/var/lib/myfrdcsa/packages/binary','/var/lib/myfrdcsa/capabilities','/var/lib/myfrdcsa/collections','/var/lib/myfrdcsa/datasets','/var/lib/myfrdcsa/sandbox','/var/lib/myfrdcsa/repositories/external','/var/lib/myfrdcsa/repositories/external/cvs','/var/lib/myfrdcsa/repositories/external/git','/var/lib/myfrdcsa/repositories/external/svn','/var/lib/myfrdcsa/repositories/internal','/var/lib/myfrdcsa/repositories/internal/cvs','/var/lib/myfrdcsa/repositories/internal/git','/var/lib/myfrdcsa/repositories/internal/svn'|ExtraDirs]) :-
	CatDir = '/var/lib/myfrdcsa/codebases/cats',
	findall(ExtraDir,
		(
		 directory_files(CatDir,Dirs),
		 member(Dir,Dirs),
		 Dir \= '.',
		 Dir \= '..',
		 atomic_list_concat([CatDir,'/',Dir],ExtraDir)
		),
		ExtraDirs).
	

load_myfrdcsa1p0_project_prolog_files(Project) :-
	write('LOADING PROJECT: '),write(Project),nl,
	majorMyFRDCSA1p0Directories(Directories),
	member(Directory,Directories),
	write('LOADING DIRECTORY: '),write(Directory),nl,
	load_frdcsa_project_files(Project,Directory),
	fail.
load_myfrdcsa1p0_project_prolog_files(Project).

majorMyFRDCSA1p1Directories(['/var/lib/myfrdcsas/versions/myfrdcsa-1.1/vagrant-machines','/var/lib/myfrdcsas/versions/myfrdcsa-1.1/vagrant']).



load_myfrdcsa1p1_project_prolog_files(Project) :-
	write('LOADING PROJECT: '),write(Project),nl,
	majorMyFRDCSA1p1Directories(Directories),
	member(Directory,Directories),
	write('LOADING DIRECTORY: '),write(Directory),nl,
	load_myfrdcsa1p1_project_files(Project,Directory),
	fail.
load_myfrdcsa1p1_project_prolog_files(Project).
