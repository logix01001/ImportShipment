<?php

namespace Tests\Unit;

use App\Jobs\IMSDocsUpdate;
use Tests\TestCase;

class IMSUpdateClassTest extends TestCase
{
    /**
     * A basic unit test example.
     *
     * @return void
     */
    public function test_blfound_find()
    {
        $ims = new IMSDocsUpdate("EGLV020100155566","target_gatepass","2021-06-10","JEROME");
        $this->assertEquals( $ims->handle() , 1);
    }


    public function test_blnotfound_find()
    {
        $ims = new IMSDocsUpdate("EGLV0201001555665665655","target_gatepass","2021-06-10","JEROME");
        $this->assertEquals( $ims->handle() , 0);
    }

    public function test_bl_assert()
    {
        $ims = new IMSDocsUpdate("EGLV020100155566","target_gatepass","2021-06-10","JEROME");
        $this->assertEquals( $ims->handle() , "EGLV020100155566");
    }

    public function test_target_gatepass_assert()
    {
        $ims = new IMSDocsUpdate("EGLV020100155566","target_gatepass","2021-06-10","JEROME");
        $this->assertEquals( $ims->handle() , "target_gatepass");
    }

    public function test_value_assert()
    {
        $ims = new IMSDocsUpdate("EGLV020100155566","target_gatepass","2021-06-10","JEROME");
        $this->assertEquals( $ims->handle() , "2021-06-10");
    }

    public function test_updatedby_assert()
    {
        $ims = new IMSDocsUpdate("EGLV020100155566","target_gatepass","2021-06-10","JEROME");
        $this->assertEquals( $ims->handle() , "JEROME");
    }
}
