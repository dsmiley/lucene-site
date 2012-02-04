package path;
use ASF::Value;

# taken from django's url.py
$localMode = 0;

# Patterns should go from more restrictive matches to less restrictive.
our @patterns = (
  [qr!core\/mirrors-core-redir\.mdtext$!, main => { template => "mirrors-core-redir.html"	}],# have downloads go to a redirect so that we can see how many people are actually clicking the link
  [qr!solr\/mirrors-solr-redir\.mdtext$!, main => { template => "mirrors-solr-redir.html"	}],
  [qr!core\/index\.mdtext$!, main => { template => "core.html",
  	jira     => ASF::Value::Jira->new(limit => 5,
                                      url => "http://s.apache.org/corejira", localMode => $localMode),
    svn      => ASF::Value::SVN->new(limit => 5, project => "/lucene/dev/trunk",
                                      localMode => $localMode),
    coreuser => ASF::Value::Mail->new(list => 'java-user@lucene.apache.org',
                                          limit => 3,
                                          localMode => $localMode),
    dev => ASF::Value::Mail->new(list => 'dev@lucene.apache.org',
                                          limit => 3, localMode => $localMode),

                                      }],
  [qr!solr\/index\.mdtext$!, main => {
    template => "solr.html",
    svn      => ASF::Value::SVN->new(limit => 5, project => "/lucene/dev/trunk",
                                      localMode => $localMode),
    jira     => ASF::Value::Jira->new(limit => 5,
                                      url => "http://s.apache.org/solrjira",
                                      localMode => $localMode),
    solruser => ASF::Value::Mail->new(list => 'solr-user@lucene.apache.org',
                                          limit => 3, localMode => $localMode),
    dev => ASF::Value::Mail->new(list => 'dev@lucene.apache.org',
                                          limit => 3, localMode => $localMode),
    solrtwitter  => ASF::Value::Twitter->new(search => '#solr', limit => 3,
                                        localMode => $localMode),
  }],
	[qr!pylucene/jcc/index\.mdtext$!, main => { template => "jcc.html" }],
	[qr!pylucene/index\.mdtext$!, main => { template => "pylucene.html" }],
	[qr!openrelevance\/index\.mdtext$!, main => { template => "openrelevance.html" }],

	[qr!privacy\.mdtext$!, main => { template => "simple.html" }],

	  [qr!\/lucene\/index\.mdtext$!, main => { template => "main.html" }],

	 [qr!core\/.*?\.mdtext$!, main => { template => "core-simple.html"
	}],

	[qr@solr\/(?!index).*?\.mdtext$@, main => { template => "solr-simple.html"}],
	[qr!pylucene/jcc/.*?\.mdtext$!, main => { template => "jcc-simple.html" }],
	[qr!pylucene/.*?\.mdtext$!, main => { template => "pylucene-simple.html" }],
	[qr!openrelevance\/.*?\.mdtext$!, main => { template => "openrelevance-simple.html" }],

	# keep the general one last
  [qr!\/index\.mdtext$!, main => { template => "main.html"}],
  [qr!\.mdtext$!, main => { template => "simple.html"	 }],
) ;

# for specifying interdependencies between files

#our %dependencies = (
#    "/lucene/sitemap.html" => [ grep s!^content!!, glob "content/lucene/*.mdtext" ],
#);

1;

=head1 LICENSE

           Licensed to the Apache Software Foundation (ASF) under one
           or more contributor license agreements.  See the NOTICE file
           distributed with this work for additional information
           regarding copyright ownership.  The ASF licenses this file
           to you under the Apache License, Version 2.0 (the
           "License"); you may not use this file except in compliance
           with the License.  You may obtain a copy of the License at

             http://www.apache.org/licenses/LICENSE-2.0

           Unless required by applicable law or agreed to in writing,
           software distributed under the License is distributed on an
           "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
           KIND, either express or implied.  See the License for the
           specific language governing permissions and limitations
           under the License.


