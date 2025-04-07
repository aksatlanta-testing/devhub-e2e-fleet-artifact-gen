
{{- define "go-echod9aca46c-138f-4633-bb5b-0108c956aece.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod9aca46c-138f-4633-bb5b-0108c956aece.fullname" -}}
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


{{- define "go-echod9aca46c-138f-4633-bb5b-0108c956aece.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod9aca46c-138f-4633-bb5b-0108c956aece.labels" -}}
helm.sh/chart: {{ include "go-echod9aca46c-138f-4633-bb5b-0108c956aece.chart" . }}
{{ include "go-echod9aca46c-138f-4633-bb5b-0108c956aece.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod9aca46c-138f-4633-bb5b-0108c956aece.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod9aca46c-138f-4633-bb5b-0108c956aece.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}