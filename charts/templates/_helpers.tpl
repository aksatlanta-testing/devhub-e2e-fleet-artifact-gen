
{{- define "go-echo86149b41-f2e2-406c-8cd1-763325308acc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo86149b41-f2e2-406c-8cd1-763325308acc.fullname" -}}
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


{{- define "go-echo86149b41-f2e2-406c-8cd1-763325308acc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo86149b41-f2e2-406c-8cd1-763325308acc.labels" -}}
helm.sh/chart: {{ include "go-echo86149b41-f2e2-406c-8cd1-763325308acc.chart" . }}
{{ include "go-echo86149b41-f2e2-406c-8cd1-763325308acc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo86149b41-f2e2-406c-8cd1-763325308acc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo86149b41-f2e2-406c-8cd1-763325308acc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}