
{{- define "go-echodd1100cf-9204-414e-adea-2e60c0d0333a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodd1100cf-9204-414e-adea-2e60c0d0333a.fullname" -}}
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


{{- define "go-echodd1100cf-9204-414e-adea-2e60c0d0333a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodd1100cf-9204-414e-adea-2e60c0d0333a.labels" -}}
helm.sh/chart: {{ include "go-echodd1100cf-9204-414e-adea-2e60c0d0333a.chart" . }}
{{ include "go-echodd1100cf-9204-414e-adea-2e60c0d0333a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodd1100cf-9204-414e-adea-2e60c0d0333a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodd1100cf-9204-414e-adea-2e60c0d0333a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}