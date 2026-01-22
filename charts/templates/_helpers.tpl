
{{- define "go-echof6730b30-fe5c-4535-b2a9-14376f6bb282.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof6730b30-fe5c-4535-b2a9-14376f6bb282.fullname" -}}
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


{{- define "go-echof6730b30-fe5c-4535-b2a9-14376f6bb282.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof6730b30-fe5c-4535-b2a9-14376f6bb282.labels" -}}
helm.sh/chart: {{ include "go-echof6730b30-fe5c-4535-b2a9-14376f6bb282.chart" . }}
{{ include "go-echof6730b30-fe5c-4535-b2a9-14376f6bb282.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof6730b30-fe5c-4535-b2a9-14376f6bb282.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof6730b30-fe5c-4535-b2a9-14376f6bb282.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}