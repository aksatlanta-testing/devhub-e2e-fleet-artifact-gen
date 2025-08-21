
{{- define "go-echod670fa61-a6aa-4dfd-b7bc-2dd5fdff2f02.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod670fa61-a6aa-4dfd-b7bc-2dd5fdff2f02.fullname" -}}
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


{{- define "go-echod670fa61-a6aa-4dfd-b7bc-2dd5fdff2f02.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod670fa61-a6aa-4dfd-b7bc-2dd5fdff2f02.labels" -}}
helm.sh/chart: {{ include "go-echod670fa61-a6aa-4dfd-b7bc-2dd5fdff2f02.chart" . }}
{{ include "go-echod670fa61-a6aa-4dfd-b7bc-2dd5fdff2f02.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod670fa61-a6aa-4dfd-b7bc-2dd5fdff2f02.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod670fa61-a6aa-4dfd-b7bc-2dd5fdff2f02.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}