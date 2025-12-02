
{{- define "go-echo6080ec72-aeb1-4d7b-8956-49f8ab3683cb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6080ec72-aeb1-4d7b-8956-49f8ab3683cb.fullname" -}}
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


{{- define "go-echo6080ec72-aeb1-4d7b-8956-49f8ab3683cb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6080ec72-aeb1-4d7b-8956-49f8ab3683cb.labels" -}}
helm.sh/chart: {{ include "go-echo6080ec72-aeb1-4d7b-8956-49f8ab3683cb.chart" . }}
{{ include "go-echo6080ec72-aeb1-4d7b-8956-49f8ab3683cb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6080ec72-aeb1-4d7b-8956-49f8ab3683cb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6080ec72-aeb1-4d7b-8956-49f8ab3683cb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}