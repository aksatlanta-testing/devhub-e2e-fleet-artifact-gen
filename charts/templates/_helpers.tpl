
{{- define "go-echo1abfe48d-fce5-49b2-a36b-ab6b42794bdc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1abfe48d-fce5-49b2-a36b-ab6b42794bdc.fullname" -}}
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


{{- define "go-echo1abfe48d-fce5-49b2-a36b-ab6b42794bdc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1abfe48d-fce5-49b2-a36b-ab6b42794bdc.labels" -}}
helm.sh/chart: {{ include "go-echo1abfe48d-fce5-49b2-a36b-ab6b42794bdc.chart" . }}
{{ include "go-echo1abfe48d-fce5-49b2-a36b-ab6b42794bdc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1abfe48d-fce5-49b2-a36b-ab6b42794bdc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1abfe48d-fce5-49b2-a36b-ab6b42794bdc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}