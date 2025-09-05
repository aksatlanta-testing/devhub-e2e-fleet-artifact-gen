
{{- define "go-echo48c7e646-a7f1-43cb-9a42-0ea9fdacb0de.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo48c7e646-a7f1-43cb-9a42-0ea9fdacb0de.fullname" -}}
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


{{- define "go-echo48c7e646-a7f1-43cb-9a42-0ea9fdacb0de.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo48c7e646-a7f1-43cb-9a42-0ea9fdacb0de.labels" -}}
helm.sh/chart: {{ include "go-echo48c7e646-a7f1-43cb-9a42-0ea9fdacb0de.chart" . }}
{{ include "go-echo48c7e646-a7f1-43cb-9a42-0ea9fdacb0de.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo48c7e646-a7f1-43cb-9a42-0ea9fdacb0de.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo48c7e646-a7f1-43cb-9a42-0ea9fdacb0de.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}