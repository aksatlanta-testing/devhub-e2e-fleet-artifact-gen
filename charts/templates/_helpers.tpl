
{{- define "go-echobfde250e-ceca-4cfd-8f42-aac3d705c556.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobfde250e-ceca-4cfd-8f42-aac3d705c556.fullname" -}}
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


{{- define "go-echobfde250e-ceca-4cfd-8f42-aac3d705c556.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobfde250e-ceca-4cfd-8f42-aac3d705c556.labels" -}}
helm.sh/chart: {{ include "go-echobfde250e-ceca-4cfd-8f42-aac3d705c556.chart" . }}
{{ include "go-echobfde250e-ceca-4cfd-8f42-aac3d705c556.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobfde250e-ceca-4cfd-8f42-aac3d705c556.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobfde250e-ceca-4cfd-8f42-aac3d705c556.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}