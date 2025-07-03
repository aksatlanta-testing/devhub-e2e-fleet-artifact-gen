
{{- define "go-echobf37fe44-0bee-4556-8c75-c9d7c4000ee5.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobf37fe44-0bee-4556-8c75-c9d7c4000ee5.fullname" -}}
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


{{- define "go-echobf37fe44-0bee-4556-8c75-c9d7c4000ee5.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobf37fe44-0bee-4556-8c75-c9d7c4000ee5.labels" -}}
helm.sh/chart: {{ include "go-echobf37fe44-0bee-4556-8c75-c9d7c4000ee5.chart" . }}
{{ include "go-echobf37fe44-0bee-4556-8c75-c9d7c4000ee5.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobf37fe44-0bee-4556-8c75-c9d7c4000ee5.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobf37fe44-0bee-4556-8c75-c9d7c4000ee5.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}