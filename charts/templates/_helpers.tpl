
{{- define "go-echob8ae2e76-6bf4-4f08-993b-b66d67a14314.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob8ae2e76-6bf4-4f08-993b-b66d67a14314.fullname" -}}
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


{{- define "go-echob8ae2e76-6bf4-4f08-993b-b66d67a14314.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob8ae2e76-6bf4-4f08-993b-b66d67a14314.labels" -}}
helm.sh/chart: {{ include "go-echob8ae2e76-6bf4-4f08-993b-b66d67a14314.chart" . }}
{{ include "go-echob8ae2e76-6bf4-4f08-993b-b66d67a14314.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob8ae2e76-6bf4-4f08-993b-b66d67a14314.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob8ae2e76-6bf4-4f08-993b-b66d67a14314.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}