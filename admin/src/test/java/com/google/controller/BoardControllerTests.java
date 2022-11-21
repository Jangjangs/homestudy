package com.google.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.domain.BoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
/**
 * @WebAppConfiguration
 * Test for Controller 테스트할 DI 컨테이너를 웹 애플리케이션 전용 DI 컨테이너로 처리
 * Servlet의 ServletContext를 이용하기 위해서인데 스프링에선 WebApplicationContext라는 존재를 이용하기 위해서
 * @author lake
 */
@WebAppConfiguration	
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
						"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class BoardControllerTests {

	@Setter(onMethod_= {@Autowired} )
	private WebApplicationContext ctx; //테스트할 Application Context를 인젝션
	
	/**
	 * 웹 애플리케이션을 애플리케이션 서버에 배포하지 않고도 스프링 MVC의 동작을 재현할 수 있는 클래스
	 * 
	 * MockMv는 "가짜 mvc"로 가짜로 URL과 파라미터를 브라우저에서 사용하는 것처럼 만들어 Controller를 실행할 수 있다.
	 *  testList는 MockMvcRequestBuilders로 GET 방식의 호출을 한다.
	 * 이후 BoardController의 getList 반환값을 이용해 Model에 어떤 데이터들이 담겨 있는지 확인한다.
	 */
	private MockMvc mockMvc; // mockMvc 생성 테스트용
	
	/**
	 * MvckMvcRequestBuilders
· MvckMvcRequestBuilders의 메소드들은 GET, POST, PUT, DELETE 요청 방식과 매핑되는 get(), post(), put(), delete() 메소드를 제공한다.

- 이 메소드들은 MockHttpServletRequestBuilder 객체를 리턴하고, 이를 통해 HTTP 요청 관련 정보(파라미터, 헤더, 쿠키 등)를 설정할 수 있다.

- MockHttpServletRequestBuilder의 메소드는 MockHttpServletRequestBuilder 객체를 다시 리턴하여 메시지 체인을 구성하여 복잡한 요청을 설정할 수도 있다.
	 */
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build(); 
		//WebApplicationContext를 가지고 MockMvc를 초기화 합니다.
	}
	
	//@Test
	public void testList() throws Exception {				
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/board/list")) //경로에 해당하는 String 혹은 URI를 파라미터로 받습니다.
				.andReturn().getModelAndView().getModelMap()
				);
		/**
		 * MvcResult andReturn() : 요청을 실행한 결과를 MvcReesult 타입으로 리턴합니다.
		 * ModelAndView getModelAndView() : 핸들러에 의해 준비된 ModelAndView를 리턴합니다.
		 * Model 객체 전달 getModelMap() 을 사용
		 */
	}
	
	//@Test
	public void testRegister() throws Exception {
		mockMvc.perform(MockMvcRequestBuilders.post("/board/register")
				.param("title", "테스트 제목")
				.param("content", "테스트 내용")
				.param("writer", "user00"))
		
		.andReturn().getModelAndView().getViewName();
		//getViewName()을 통해 해당되는 jsp 이름을 받아온다
		//알맞은 메서드가 리턴한결과를 확인한다

	}
	
	//@Test
	public void testget() throws Exception {
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/board/get")
				.param("bno", "1"))
				.andReturn().getModelAndView().getModelMap()
				);
	}
	
	//@Test
	public void testModify() throws Exception {
		mockMvc.perform(MockMvcRequestBuilders.post("/board/modify")
				.param("bno", "2")
				.param("title", "테스트 수정 제목")
				.param("content", "테스트 수정 내용")
				.param("writer", "user00"))
		
		.andReturn().getModelAndView().getViewName();
	}
	
	@Test
	public void testremove() throws Exception {
		log.info(mockMvc.perform(MockMvcRequestBuilders.post("/board/remove")
				.param("bno", "1"))
				.andReturn().getModelAndView().getViewName()
				);
	}
	
	/**
	 * mockMvc의 메소드 
1) perform()

요청을 전송하는 역할을 합니다. 결과로 ResultActions 객체를 받으며, ResultActions 객체는 리턴 값을 검증하고 확인할 수 있는 andExcpect() 메소드를 제공해줍니다.
 

2) get("/mock/blog")

HTTP 메소드를 결정할 수 있습니다. ( get(), post(), put(), delete() )
인자로는 경로를 보내줍니다.
 

3) params(info)

키=값의 파라미터를 전달할 수 있습니다.
여러 개일 때는 params()를, 하나일 때에는 param()을 사용합니다.
 

4) andExpect()

응답을 검증하는 역할을 합니다.
상태 코드 ( status() )
	메소드 이름 : 상태코드
	isOk() : 200
	isNotFound() : 404
	isMethodNotAllowed() : 405
	isInternalServerError() : 500
	is(int status) : status 상태 코드
뷰 ( view() )
	리턴하는 뷰 이름을 검증합니다.
	ex. view().name("blog") : 리턴하는 뷰 이름이 blog인가?
리다이렉트 ( redirect() )
	리다이렉트 응답을 검증합니다.
	ex. redirectUrl("/blog") : '/blog'로 리다이렉트 되었는가?
모델 정보 ( model() )
	컨트롤러에서 저장한 모델들의 정보 검증
응답 정보 검증 ( content() )
	응답에 대한 정보를 검증해줍니다.
 

5) andDo(print())

요청/응답 전체 메세지를 확인할 수 있습니다.
	 */
}
