
{{- define "go-echo45b2e607-ff0d-40d2-b557-57794a6fbdcf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo45b2e607-ff0d-40d2-b557-57794a6fbdcf.fullname" -}}
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


{{- define "go-echo45b2e607-ff0d-40d2-b557-57794a6fbdcf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo45b2e607-ff0d-40d2-b557-57794a6fbdcf.labels" -}}
helm.sh/chart: {{ include "go-echo45b2e607-ff0d-40d2-b557-57794a6fbdcf.chart" . }}
{{ include "go-echo45b2e607-ff0d-40d2-b557-57794a6fbdcf.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo45b2e607-ff0d-40d2-b557-57794a6fbdcf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo45b2e607-ff0d-40d2-b557-57794a6fbdcf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}