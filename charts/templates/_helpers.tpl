
{{- define "go-echobca0fb55-80d3-4fc1-ad30-200c3f03dcd6.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobca0fb55-80d3-4fc1-ad30-200c3f03dcd6.fullname" -}}
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


{{- define "go-echobca0fb55-80d3-4fc1-ad30-200c3f03dcd6.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobca0fb55-80d3-4fc1-ad30-200c3f03dcd6.labels" -}}
helm.sh/chart: {{ include "go-echobca0fb55-80d3-4fc1-ad30-200c3f03dcd6.chart" . }}
{{ include "go-echobca0fb55-80d3-4fc1-ad30-200c3f03dcd6.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobca0fb55-80d3-4fc1-ad30-200c3f03dcd6.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobca0fb55-80d3-4fc1-ad30-200c3f03dcd6.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}