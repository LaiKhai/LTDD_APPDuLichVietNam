@extends('layouts.app')
@section('title')
Danh sách thông tin bài viết
@endsection
@section('content-wrapper')
@parent
<div class="page-header">
    <h3 class="page-title">@yield('title')</h3>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#">Dashboar</a></li>
            <li class="breadcrumb-item active" aria-current="page">@yield('title')</li>
        </ol>
    </nav>
</div>
<div class="row">
    <div class="col-lg-12 grid-margin stretch-card">
        <div class="card">
            <div class="card-body">
                <h4 class="card-title">@yield('title')</h4>
                </p>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th class="text-center"> ID </th>
                            <th class="text-center"> Tiêu đề </th>
                            <th class="text-center"> Mô tả </th>
                            <th class="text-center"> Thuộc địa danh</th>
                            <th class="text-center"> Tài Khoản</th>
                            <th class="text-center"> Trạng thái </th>
                            <th class="text-center"> Chức năng </th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($lstbaiviet as $baiviet)
                        <tr>
                            <td class="text-center">{{$baiviet->id}}</td>

                            <td class="text-center">{{$baiviet->tieude}}</td>
                            <td>
                                <div style="width: 100px;
                                    white-space: normal;">{{$baiviet->mota}}</div>
                            </td>
                            <td class="text-center">@foreach ($lstdiadanh as $item)
                                {{$item->tendiadanh}}
                                @endforeach
                            </td>
                            <td class="text-center">@foreach ($lstuser as $user)
                                {{$user->email}}
                                @endforeach
                            </td>
                            <td class="text-center">
                                @if ($baiviet->trangthai==1)
                                <span class="badge bg-success text-white">Tồn tại</span>
                                @endif
                                @if ($baiviet->trangthai==0)
                                <span class="badge bg-danger text-white">Đã xóa</span>
                                @endif
                                @if ($baiviet->trangthai==2)
                                <span class="badge bg-warining text-white">Đang xử lí</span>
                                @endif
                            </td>
                            <td class="text-center">
                                <a type="button" class="btn btn-outline-warning"
                                    href="{{route('baiviet.show',['baiviet'=>$baiviet])}}">chi
                                    tiết</a>
                                <a type="button" class="btn btn-outline-success"
                                    href="{{route('baiviet.edit',['baiviet'=>$baiviet])}}">Sửa</a>
                            </td>
                            <td class="text-center">
                                <form method="POST" action="{{route('baiviet.destroy',['baiviet'=>$baiviet])}}">
                                    @csrf
                                    @method('DELETE')
                                    <button type="submit" class="btn btn-outline-danger">Xóa</button>
                                </form>
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
@endsection