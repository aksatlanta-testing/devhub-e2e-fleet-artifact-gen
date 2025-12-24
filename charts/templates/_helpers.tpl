
{{- define "go-echo1fcd5434-c8fc-4895-939a-669f00d655fe.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1fcd5434-c8fc-4895-939a-669f00d655fe.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echo1fcd5434-c8fc-4895-939a-669f00d655fe.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1fcd5434-c8fc-4895-939a-669f00d655fe.labels" -}}
helm.sh/chart: {{ include "go-echo1fcd5434-c8fc-4895-939a-669f00d655fe.chart" . }}
{{ include "go-echo1fcd5434-c8fc-4895-939a-669f00d655fe.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1fcd5434-c8fc-4895-939a-669f00d655fe.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1fcd5434-c8fc-4895-939a-669f00d655fe.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}