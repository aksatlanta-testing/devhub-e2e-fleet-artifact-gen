
{{- define "go-echoae48b9a5-e98e-4891-af93-c1c68125b61d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoae48b9a5-e98e-4891-af93-c1c68125b61d.fullname" -}}
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


{{- define "go-echoae48b9a5-e98e-4891-af93-c1c68125b61d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoae48b9a5-e98e-4891-af93-c1c68125b61d.labels" -}}
helm.sh/chart: {{ include "go-echoae48b9a5-e98e-4891-af93-c1c68125b61d.chart" . }}
{{ include "go-echoae48b9a5-e98e-4891-af93-c1c68125b61d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoae48b9a5-e98e-4891-af93-c1c68125b61d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoae48b9a5-e98e-4891-af93-c1c68125b61d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}