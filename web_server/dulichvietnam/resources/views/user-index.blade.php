@extends('layouts.app')
@section('title')
Danh sách thông tin quán ăn
@endsection
@section('content-wrapper')
@parent
<div class="page-header">
    <h3 class="page-title">@yield('title')</h3>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#">Dashboar</a></li>
            <li class="breadcrumb-item active" aria-current="page">Thông tin quán ăn</li>
        </ol>
    </nav>
</div>
<div class="row">
    <div class="col-lg-12 grid-margin stretch-card">
        <div class="card">
            <div class="card-body">
                <h4 class="card-title">Thông tin quán ăn</h4>
                </p>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th class="text-center"> ID </th>
                            <th class="text-center"> Email </th>
                            <th class="text-center"> Password</th>
                            <th class="text-center"> Họ Tên </th>
                            <th class="text-center"> SĐT </th>
                            <th class="text-center"> Phân quyền</th>
                            <th class="text-center"> Trạng thái </th>
                            <th class="text-center"> Chức năng </th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($lstuser as $user)
                        <tr>
                            <td class="text-center">{{$user->id}}</td>
                            <td class="py-1">
                                {{$user->email}}
                            </td>
                            <td class="text-center">
                                <div style="width: 300px;
                                    white-space: normal;">
                                    {{$user->password}}
                                </div>
                            </td>
                            <td>
                                {{$user->hoten}}
                            </td>
                            <td class="text-center">{{$user->sdt}}</td>
                            <td class="text-center">{{$user->phanquyen}}</td>
                            <td class="text-center">
                                @if ($user->trangthai==1)
                                <span class="badge bg-success text-white">Tồn tại</span>
                                @endif
                                @if ($user->trangthai==0)
                                <span class="badge bg-danger text-white">Đã xóa</span>
                                @endif
                                @if ($user->trangthai==2)
                                <span class="badge bg-warning text-white">Đang xử lí</span>
                                @endif
                            </td>
                            <td class="text-center">
                                <a type="button" class="btn btn-outline-warning"
                                    href="{{route('user.show',['user'=>$user])}}">chi
                                    tiết</a>
                                <a type="button" class="btn btn-outline-success"
                                    href="{{route('user.edit',['user'=>$user])}}">Sửa</a>
                            </td>
                            <td class="text-center">
                                <form method="POST" action="{{route('user.destroy',['user'=>$user])}}">
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