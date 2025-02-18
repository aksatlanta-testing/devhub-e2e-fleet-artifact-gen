
{{- define "go-echo4227b3ae-2e2b-4daf-8287-8588d1ae97cd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4227b3ae-2e2b-4daf-8287-8588d1ae97cd.fullname" -}}
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


{{- define "go-echo4227b3ae-2e2b-4daf-8287-8588d1ae97cd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4227b3ae-2e2b-4daf-8287-8588d1ae97cd.labels" -}}
helm.sh/chart: {{ include "go-echo4227b3ae-2e2b-4daf-8287-8588d1ae97cd.chart" . }}
{{ include "go-echo4227b3ae-2e2b-4daf-8287-8588d1ae97cd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo4227b3ae-2e2b-4daf-8287-8588d1ae97cd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo4227b3ae-2e2b-4daf-8287-8588d1ae97cd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}